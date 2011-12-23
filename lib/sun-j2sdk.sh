# Detect product
function sun_j2sdk_detect() {
  local found=
  
  case "${DEB_BUILD_ARCH:-$DEB_BUILD_GNU_TYPE}" in
    i386|i486-linux-gnu)
      case "$archive_name" in
	"j2sdk-1_4_1_"[0-9][0-9]"-linux-i586.bin") # SUPPORTED
	    j2se_version="1.4.1+${archive_name:12:2}${revision}"
	    j2se_expected_min_size=77 # 79515 kB
	    found=true
	    ;;
	"j2sdk-1_4_2-linux-i586.bin") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=87 # 89150 kB
	    found=true
	    ;;
	"j2sdk-1_4_2_"[0-9][0-9]"-linux-i586.bin") # SUPPORTED
	    j2se_version="1.4.2+${archive_name:12:2}${revision}"
	    j2se_expected_min_size=87 # 89281 kB
	    found=true
	    ;;
	"jdk-1_5_0-beta2-linux-i586.bin") # SUPPORTED
	    j2se_version=1.5.0+beta2${revision}
	    j2se_expected_min_size=122 # 125899 kB
	    found=true
	    ;;
	"jdk-1_5_0-linux-i586.bin") # SUPPORTED
	    j2se_version=1.5.0+update00${revision}
	    j2se_expected_min_size=134 # 136608 kB
	    found=true
	    ;;
	"jdk-1_5_0_"[0-9][0-9]"-linux-i586.bin") # SUPPORTED
	    j2se_version=1.5.0+update${archive_name:10:2}${revision}
	    j2se_expected_min_size=130
	    found=true
	    ;;
	"jdk-6-beta-linux-i586.bin") # SUPPORTED
	    j2se_version=1.6.0+beta${revision}
	    j2se_expected_min_size=130
	    found=true
	    ;;
	"jdk-6-linux-i586.bin") # SUPPORTED
	    j2se_version=1.6.0${revision}
	    j2se_expected_min_size=130
	    found=true
	    ;;
	"jdk-6u"[0-9]"-linux-i586.bin") # SUPPORTED
	    j2se_version=1.6.0+update${archive_name:6:1}${revision}
	    j2se_expected_min_size=130
	    found=true
	    ;;
	"jdk-6u"[0-9][0-9]"-linux-i586.bin") # SUPPORTED
	    j2se_version=1.6.0+update${archive_name:6:2}${revision}
	    j2se_expected_min_size=130
	    found=true
	    ;;
      esac
      ;;
    ia64|ia64-linux-gnu)
      case "$archive_name" in
	"j2sdk-1_4_1-linux-ia64.bin") # SUPPORTED
	    j2se_version=1.4.1${revision}
	    j2se_expected_min_size=86 # 88452 kB
	    found=true
	    ;;
        "j2sdk-1_4_2_"[0-9][0-9]"-linux-ia64.bin") # SUPPORTED
	    j2se_version="1.4.2+${archive_name:12:2}${revision}"
	    j2se_expected_min_size=107 # 109256 kB
	    found=true
	    ;;
      esac
      ;;
    amd64|x86_64-linux-gnu)
      case "$archive_name" in
	"jdk-1_5_0-beta2-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.5.0+beta2${revision}
	    j2se_expected_min_size=108 # 110956 kB
	    found=true
	    ;;
	"jdk-1_5_0-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.5.0+update00${revision}
	    j2se_expected_min_size=110 # 112940 kB
	    found=true
	    ;;
	"jdk-1_5_0_"[0-9][0-9]"-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.5.0+update${archive_name:10:2}${revision}
	    j2se_expected_min_size=105
	    found=true
	    ;;
	"jdk-6-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.6.0${revision}
	    j2se_expected_min_size=130
	    found=true
	    ;;
	"jdk-6u"[0-9]"-linux-amd64.bin") # SUPPORTED
	    j2se_version=1.6.0+update${archive_name:6:1}${revision}
	    j2se_expected_min_size=130
	    found=true
	    ;;
	"jdk-6u"[0-9]"-linux-x64.bin") # SUPPORTED
	    j2se_version=1.6.0+update${archive_name:6:1}${revision}
	    j2se_expected_min_size=130
	    found=true
	    ;;
	"jdk-6u"[0-9][0-9]"-linux-x64.bin") # SUPPORTED
	    j2se_version=1.6.0+update${archive_name:6:2}${revision}
	    j2se_expected_min_size=130
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
    Sun Microsystems(TM), Inc.
EOF
	if read_yn "Is this correct [Y/n]: "; then
	    j2se_found=true
	    j2se_release="${j2se_version:0:3}"
	    j2se_required_space=$(( $j2se_expected_min_size * 2 + 20 ))
	    j2se_vendor="sun"
	    j2se_title="Java(TM) JDK, Standard Edition, Sun Microsystems(TM)"
	    j2sdk_run
	fi
    fi
}

j2se_detect_sun_j2sdk=sun_j2sdk_detect
