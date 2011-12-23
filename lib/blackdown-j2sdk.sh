# Detect product
function blackdown_j2sdk_detect() {
  local found=
  
  case "${DEB_BUILD_ARCH:-$DEB_BUILD_GNU_TYPE}" in
    i386|i486-linux-gnu)
      case "$archive_name" in
	"j2sdk-1.3.1-02a-FCS-linux-i386.bin") # SUPPORTED
	    j2se_version=1.3.1+02a${revision}
	    j2se_expected_min_size=22 # 24.2 MB
	    found=true
	    ;;
	"j2sdk-1.3.1-02b-FCS-linux-i386.bin") # SUPPORTED
	    j2se_version=1.3.1+02b${revision}
	    j2se_expected_min_size=22 # 24 MB
	    found=true
	    ;;
	"j2sdk-1.4.1-01-linux-i586-gcc2.95.bin") # SUPPORTED
	    j2se_version=1.4.1+01${revision}
	    j2se_expected_min_size=78 # 80653 kB
	    found=true
	    ;;
	"j2sdk-1.4.1-01-linux-i586-gcc3.2.bin") # SUPPORTED
	    j2se_version=1.4.1+01${revision}
	    j2se_expected_min_size=76 # 78055 kB
	    found=true
	    ;;
	"j2sdk-1.4.2-rc1-linux-i586-gcc2.95.bin") # SUPPORTED
	    j2se_version=1.4.2+rc1${revision}
	    j2se_expected_min_size=76 # 78055 kB
	    found=true
	    ;;
	"j2sdk-1.4.2-rc1-linux-i586-gcc3.2.bin") # SUPPORTED
	    j2se_version=1.4.2+rc1${revision}
	    j2se_expected_min_size=76 # 78055 kB
	    found=true
	    ;;
	"j2sdk-1.4.2-fcs-linux-i586-gcc2.95.bin") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=90 # 92740 kB
	    found=true
	    ;;
	"j2sdk-1.4.2-fcs-linux-i586-gcc3.2.bin") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=88 # 90316 kB
	    found=true
	    ;;
	"j2sdk-1.4.2-01-linux-i586.bin") # SUPPORTED
	    j2se_version=1.4.2+01${revision}
	    j2se_expected_min_size=88 # 90316 kB
	    found=true
	    ;;
	"j2sdk-1.4.2-02-linux-i586.bin") # SUPPORTED
	    j2se_version=1.4.2+02${revision}
	    j2se_expected_min_size=88 # 90316 kB
	    found=true
	    ;;
      esac
      ;;
    sparc|sparc-linux)
      case "$archive_name" in
	"j2sdk-1.3.1-02b-FCS-linux-sparc.bin") # SUPPORTED
	    j2se_version=1.3.1+02b${revision}
	    j2se_expected_min_size=44 # 46048 kB
	    found=true
	    ;;
	"j2sdk-1.4.1-01-linux-sparc-gcc3.2.bin") # SUPPORTED
	    j2se_version=1.4.1+01${revision}
	    j2se_expected_min_size=83 # 85712 kB
	    found=true
	    ;;
      esac
      ;;
    amd64|x86_64-linux-gnu)
      case "$archive_name" in
	"j2sdk-1.4.2-rc1-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.4.2+rc1${revision}
	    j2se_expected_min_size=86 # 88556 kB
	    found=true
	    ;;
	"j2sdk-1.4.2-fcs-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=89 # 91460 kB
	    found=true
	    ;;
	"j2sdk-1.4.2-01-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.4.2+01${revision}
	    j2se_expected_min_size=89 # 90420 kB
	    found=true
	    ;;
	"j2sdk-1.4.2-02-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.4.2+02${revision}
	    j2se_expected_min_size=89 # 90420 kB
	    found=true
	    ;;
      esac
      ;;
    powerpc|powerpc-linux)
      case "$archive_name" in
        "j2sdk-1.3.1-14-FCS-linux-ppc.bin") # SUPPORTED
            j2se_version=1.3.1${revision}
            j2se_expected_min_size=19 # 21776636 bytes
            found=true
            ;;
        "j2sdk-1.3.1-02a-FCS-linux-ppc.bin") # SUPPORTED
            j2se_version=1.3.1+02a${revision}
            j2se_expected_min_size=19 # 21398886 bytes
            found=true
            ;;
        "j2sdk-1.3.1-14-FCS-linux-ppc.bin") # SUPPORTED
            j2se_version=1.3.1+02b${revision}
            j2se_expected_min_size=20 # 21380823 bytes
            found=true
            ;;
        "j2sdk-1.3.1-02c-FCS-linux-ppc.bin") # SUPPORTED
            j2se_version=1.3.1+02c${revision}
            j2se_expected_min_size=19 # 21715354 bytes
            found=true
            ;;
      esac
      ;;
  esac
  if [[ -n "$found" ]]; then
    cat << EOF

Detected product:
    Java(TM) Development Kit (JDK)
    Standard Edition, Version $j2se_version
    Blackdown Java-Linux
EOF
	if read_yn "Is this correct [Y/n]: "; then
	    j2se_found=true
	    j2se_release="${j2se_version:0:3}"
	    j2se_required_space=$(( $j2se_expected_min_size * 2 + 20 ))
	    j2se_vendor="blackdown"
	    j2se_title="Java(TM) JDK, Standard Edition, Blackdown"
	    j2sdk_run
	fi
    fi
}

j2se_detect_blackdown_j2sdk=blackdown_j2sdk_detect
