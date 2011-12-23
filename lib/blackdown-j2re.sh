# Detect product
function blackdown_j2re_detect() {
  local found=
  
  case "${DEB_BUILD_ARCH:-$DEB_BUILD_GNU_TYPE}" in
    i386|i486-linux-gnu)
      case "$archive_name" in
	"j2re-1.3.1-02b-FCS-linux-i386.bin") # SUPPORTED
	    j2se_version=1.3.1+02a${revision}
	    j2se_expected_min_size=35 # 35882 kB
	    found=true
	    ;;
	"j2re-1.3.1-02b-FCS-linux-i386.bin") # SUPPORTED
	    j2se_version=1.3.1+02b${revision}
	    j2se_expected_min_size=35 # 35882 kB
	    found=true
	    ;;
	"j2re-1.4.1-01-linux-i586-gcc2.95.bin") # SUPPORTED
	    j2se_version=1.4.1+01${revision}
	    j2se_expected_min_size=51 # 52631 kB
	    found=true
	    ;;
	"j2re-1.4.1-01-linux-i586-gcc3.2.bin") # SUPPORTED
	    j2se_version=1.4.1+01${revision}
	    j2se_expected_min_size=48 # 49988 kB
	    found=true
	    ;;
	"j2re-1.4.2-rc1-linux-i586-gcc2.95.bin") # SUPPORTED
	    j2se_version=1.4.2+rc1${revision}
	    j2se_expected_min_size=48 # 49988 kB
	    found=true
	    ;;
	"j2re-1.4.2-rc1-linux-i586-gcc3.2.bin") # SUPPORTED
	    j2se_version=1.4.2+rc1${revision}
	    j2se_expected_min_size=48 # 49988 kB
	    found=true
	    ;;
	"j2re-1.4.2-fcs-linux-i586-gcc2.95.bin") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=56 # 58044 kB
	    found=true
	    ;;
	"j2re-1.4.2-fcs-linux-i586-gcc3.2.bin") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=54 # 55524 kB
	    found=true
	    ;;
	"j2re-1.4.2-01-linux-i586.bin") # SUPPORTED
	    j2se_version=1.4.2+01${revision}
	    j2se_expected_min_size=54 # 54958 kB
	    found=true
	    ;;
	"j2re-1.4.2-02-linux-i586.bin") # SUPPORTED
	    j2se_version=1.4.2+02${revision}
	    j2se_expected_min_size=54 # 54958 kB
	    found=true
	    ;;
      esac
      ;;
    sparc|sparc-linux)
      case "$archive_name" in
	"j2re-1.3.1-02b-FCS-linux-sparc.bin") # SUPPORTED
	    j2se_version=1.3.1+02b${revision}
	    j2se_expected_min_size=26 # 27064 kB
	    found=true
	    ;;
        "j2re-1.4.1-01-linux-sparc-gcc3.2.bin") # SUPPORTED
	    j2se_version=1.4.1+01${revision}
	    j2se_expected_min_size=55 # 57084 kB
	    found=true
	    ;;
      esac
      ;;
    amd64|x86_64-linux-gnu)
      case "$archive_name" in
	"j2re-1.4.2-rc1-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.4.2+rc1${revision}
	    j2se_expected_min_size=53 # 54748 kB
	    found=true
	    ;;
	"j2re-1.4.2-fcs-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=54 # 55468 kB
	    found=true
	    ;;
	"j2re-1.4.2-01-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.4.2+01${revision}
	    j2se_expected_min_size=54 # 55071 kB
	    found=true
	    ;;
	"j2re-1.4.2-02-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.4.2+02${revision}
	    j2se_expected_min_size=54 # 55071 kB
	    found=true
	    ;;
      esac
      ;;
    powerpc|powerpc-linux)
      case "$archive_name" in
	"j2re-1.3.1-14-FCS-linux-ppc.bin") # SUPPORTED
	    j2se_version=1.3.1${revision}
	    j2se_expected_min_size=10 # 11508915 bytes
	    found=true
	    ;;
        "j2re-1.3.1-02a-FCS-linux-ppc.bin") # SUPPORTED
            j2se_version=1.3.1+02a${revision}
            j2se_expected_min_size=10 # 11010247 bytes
            found=true
            ;;
        "j2re-1.3.1-14-FCS-linux-ppc.bin") # SUPPORTED
            j2se_version=1.3.1+02b${revision}
            j2se_expected_min_size=10 # 11027038 bytes
            found=true
            ;;
        "j2re-1.3.1-02c-FCS-linux-ppc.bin") # SUPPORTED
            j2se_version=1.3.1+02c${revision}
            j2se_expected_min_size=10 # 11508915 bytes
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
    Blackdown Java-Linux
EOF
	if read_yn "Is this correct [Y/n]: "; then
	    j2se_found=true
	    j2se_release="${j2se_version:0:3}"
	    j2se_required_space=$(( $j2se_expected_min_size * 2 + 20 ))
	    j2se_vendor="blackdown"
	    j2se_title="Java(TM) JRE, Standard Edition, Blackdown"
	    j2re_run
	fi
    fi
}

j2se_detect_blackdown_j2re=blackdown_j2re_detect
