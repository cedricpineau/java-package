# Detect product
function sun_j2re_detect() {
  local found=
  
  case "${DEB_BUILD_ARCH:-$DEB_BUILD_GNU_TYPE}" in
    i386|i486-linux-gnu)
      case "$archive_name" in
	"j2re-1_4_1_"[0-9][0-9]"-linux-i586.bin") # SUPPORTED
	    j2se_version="1.4.1+${archive_name:11:2}${revision}"
	    j2se_expected_min_size=14 # 14378891 bytes
	    found=true
	    ;;
	"j2re-1_4_2-linux-i586.bin") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=14 # 14378891 bytes
	    found=true
	    ;;
	"j2re-1_4_2_"[0-9][0-9]"-linux-i586.bin") # SUPPORTED
	    j2se_version="1.4.2+${archive_name:11:2}${revision}"
	    j2se_expected_min_size=15 # 14378891 bytes
	    found=true
	    ;;
	"j2re-1_5_0-beta2-linux-i586.bin") # SUPPORTED
	    j2se_version=1.5.0+beta2${revision}
	    j2se_expected_min_size=16 # 16542512 bytes
	    found=true
	    ;;
	"jre-1_5_0-linux-i586.bin") # SUPPORTED
	    j2se_version=1.5.0+update00${revision}
	    j2se_expected_min_size=16 # 16542512 bytes
	    found=true
	    ;;
	"jre-1_5_0_"[0-9][0-9]"-linux-i586.bin") # SUPPORTED
	    j2se_version=1.5.0+update${archive_name:10:2}${revision}
	    j2se_expected_min_size=16 # 16542512 bytes
	    found=true
	    ;;
	"jre-6-linux-i586.bin") # SUPPORTED
	    j2se_version=1.6.0${revision}
	    j2se_expected_min_size=16 # 16542512 bytes
	    found=true
	    ;;
	"jre-6u"[0-9]"-linux-i586.bin") # SUPPORTED
	    j2se_version=1.6.0+update${archive_name:6:1}${revision}
	    j2se_expected_min_size=16 # 16542512 bytes
	    found=true
	    ;;
	"jre-6u"[0-9][0-9]"-linux-i586.bin") # SUPPORTED
	    j2se_version=1.6.0+update${archive_name:6:2}${revision}
	    j2se_expected_min_size=16 # 16542512 bytes
	    found=true
	    ;;
      esac
      ;;
    amd64|x86_64-linux-gnu)
      case "$archive_name" in
	"jre-1_5_0-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.5.0+update00${revision}
	    j2se_expected_min_size=65 # 69936 kB
	    found=true
	    ;;
	"jre-1_5_0_"[0-9][0-9]"-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.5.0+update${archive_name:10:2}${revision}
	    j2se_expected_min_size=60 # 69936 kB
	    found=true
	    ;;
	"jre-6u"[0-9]"-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.6.0+update${archive_name:6:1}${revision}
	    j2se_expected_min_size=16 # 16542512 bytes
	    found=true
	    ;;
	"jre-6u"[0-9]"-linux-x64.bin") # SUPPORTED
	    j2se_version=1.6.0+update${archive_name:6:1}${revision}
	    j2se_expected_min_size=16 # 16542512 bytes
	    found=true
	    ;;
	"jre-6u"[0-9][0-9]"-linux-x64.bin") # SUPPORTED
	    j2se_version=1.6.0+update${archive_name:6:2}${revision}
	    j2se_expected_min_size=16 # 16542512 bytes
	    found=true
	    ;;
      esac
      ;;
  esac
  if [[ -n "$found" ]]; then
	cat << EOF

Detected product:
    Java(TM) Runtime Environment (JRE)
    Standard Edition, Version $j2se_version
    Sun Microsystems(TM), Inc.
EOF
	if read_yn "Is this correct [Y/n]: "; then
	    j2se_found=true
	    j2se_release="${j2se_version:0:3}"
	    j2se_required_space=$(( $j2se_expected_min_size * 2 + 20 ))
	    j2se_vendor="sun"
	    j2se_title="Java(TM) JRE, Standard Edition, Sun Microsystems(TM)"
	    j2re_run
	fi
    fi
}

j2se_detect_sun_j2re=sun_j2re_detect
