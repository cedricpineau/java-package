# Detect product
j2se_detect_oracle_j2re=oracle_j2re_detect
oracle_j2re_detect() {

  if [[ $archive_name =~ jre-([0-9]+)u([0-9]+)-linux-(i586|x64)\.(bin|tar\.gz) ]]
  then
    j2se_release=${BASH_REMATCH[1]}
    j2se_update=${BASH_REMATCH[2]}
    j2se_arch=${BASH_REMATCH[3]}
    j2se_version=${j2se_release}u${j2se_update}
    j2se_priority=$((310 + $j2se_release - 1))
    j2se_expected_min_size=85 #Mb

    # check if the architecture matches
    let compatible=1
  
    case "${DEB_BUILD_ARCH:-$DEB_BUILD_GNU_TYPE}" in
      i386|i486-linux-gnu)
        if [[ "$j2se_arch" != "i586" ]]; then compatible=0; fi
        ;;
      amd64|x86_64-linux-gnu)
        if [[ "$j2se_arch" != "x64" ]]; then compatible=0; fi
        ;;
    esac

    if [[ $compatible == 0 ]]
    then
      echo "The archive $archive_name is not supported on the ${DEB_BUILD_ARCH} architecture"
      return
    fi


    cat << EOF

Detected product:
    Java(TM) Runtime Environment (JRE)
    Standard Edition, Version $j2se_release Update $j2se_update
    Oracle(TM)
EOF
    if read_yn "Is this correct [Y/n]: "; then
      j2se_found=true
      j2se_required_space=$(( $j2se_expected_min_size * 2 + 20 ))
      j2se_vendor="oracle"
      j2se_title="Java(TM) JRE, Standard Edition, Oracle(TM)"

      j2se_install=oracle_j2re_install
      j2se_remove=oracle_j2re_remove
      j2se_jinfo=oracle_j2re_jinfo
      oracle_jre_bin_hl="java javaws keytool orbd pack200 rmid rmiregistry servertool tnameserv unpack200 policytool"
      oracle_jre_bin_jre="javaws policytool"
      oracle_no_man_jre_bin_jre="ControlPanel"
      oracle_jre_lib_hl="jexec"
      j2re_run
    fi
  fi
}

oracle_j2re_install() {
    cat << EOF
if [ ! -e "$jvm_base$j2se_name/debian/info" ]; then
    exit 0
fi

install_alternatives $jvm_base$j2se_name/bin $oracle_jre_bin_hl
install_alternatives $jvm_base$j2se_name/bin $oracle_jre_bin_jre
install_no_man_alternatives $jvm_base$j2se_name/bin $oracle_no_man_jre_bin_jre
install_no_man_alternatives $jvm_base$j2se_name/lib $oracle_jre_lib_hl

plugin_dir="$jvm_base$j2se_name/lib/$DEB_BUILD_ARCH"
install_browser_plugin "/usr/lib/iceweasel/plugins" "libjavaplugin.so" "iceweasel-javaplugin.so" "\$plugin_dir/libnpjp2.so"
install_browser_plugin "/usr/lib/chromium/plugins" "libjavaplugin.so" "chromium-javaplugin.so" "\$plugin_dir/libnpjp2.so"
EOF
}

oracle_j2re_remove() {
    cat << EOF
if [ ! -e "$jvm_base$j2se_name/debian/info" ]; then
    exit 0
fi

remove_alternatives $jvm_base$j2se_name/bin $oracle_jre_bin_hl
remove_alternatives $jvm_base$j2se_name/bin $oracle_jre_bin_jre
remove_alternatives $jvm_base$j2se_name/bin $oracle_no_man_jre_bin_jre
remove_alternatives $jvm_base$j2se_name/lib $oracle_jre_lib_hl

plugin_dir="$jvm_base$j2se_name/lib/$DEB_BUILD_ARCH"
remove_browser_plugin "iceweasel-javaplugin.so" "\$plugin_dir/libnpjp2.so"
remove_browser_plugin "chromium-javaplugin.so" "\$plugin_dir/libnpjp2.so"
EOF
}

oracle_j2re_jinfo() {
    cat << EOF
name=$j2se_name
priority=$j2se_priority
section=main
EOF
    jinfos "hl" $jvm_base$j2se_name/bin/ $oracle_jre_bin_hl
    jinfos "jre" $jvm_base$j2se_name/bin/ $oracle_jre_bin_jre
    jinfos "jre" $jvm_base$j2se_name/bin/ $oracle_no_man_jre_bin_jre
    jinfos "hl" $jvm_base$j2se_name/lib/ $oracle_jre_lib_hl
    echo "plugin iceweasel-javaplugin.so $jvm_base$j2se_name/lib/$DEB_BUILD_ARCH/libnpjp2.so"
    echo "plugin chromium-javaplugin.so $jvm_base$j2se_name/lib/$DEB_BUILD_ARCH/libnpjp2.so"
}

