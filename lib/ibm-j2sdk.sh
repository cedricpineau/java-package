# Detect product
function ibm_j2sdk_detect() {
  local found=
  
  case "${DEB_BUILD_ARCH:-$DEB_BUILD_GNU_TYPE}" in
    i386|i486-linux-gnu)
      case "$archive_name" in
        "IBMJava2-SDK-131.tgz") # SUPPORTED
	    j2se_version=1.3.1${revision}
	    j2se_expected_min_size=52 # 60165118 bytes
	    found=true
	    ;;
        "IBMJava2-SDK-142.tgz") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=49 # 56719533 bytes
	    found=true
	    ;;
        "ibm-java2-sdk-50-linux-i386.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=56 # 58162719 bytes
	    found=true
	    ;;
        "ibm-java2-sdk-5.0-6.0-linux-i386.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=69 # 71512415 bytes
	    found=true
	    ;;
	"ibm-java-sdk-60-linux-i386-20070329.tgz" ) # SUPPORTED
	    j2se_version=1.6.0${revision}
	    j2se_expected_min_size=61 # 63942070 bytes
	    found=true
	    ;;
	"ibm-java-sdk-6.0-0.0-linux-i386.tgz" ) # SUPPORTED
	    j2se_version=1.6.0${revision}
	    j2se_expected_min_size=82 # 85983232 bytes
	    found=true
	    ;;
      esac
      ;;
    amd64|x86_64-linux-gnu)
      case "$archive_name" in
        "IBMJava2-SDK-AMD64-142.x86_64.tgz") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=52
	    found=true
	    ;;
        "ibm-java2-sdk-50-linux-x86_64.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=57 # 59706399 bytes
	    found=true
	    ;;
        "ibm-java2-sdk-5.0-6.0-linux-x86_64.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=69 # 71512415 bytes
	    found=true
	    ;;
	"ibm-java-sdk-60-linux-x86_64-20070329.tgz" ) # SUPPORTED
	    j2se_version=1.6.0${revision}
	    j2se_expected_min_size=61 # 63942070 bytes
	    found=true
	    ;;
	"ibm-java-sdk-6.0-0.0-linux-x86_64.tgz" ) # SUPPORTED
	    j2se_version=1.6.0${revision}
	    j2se_expected_min_size=81 # 84934656 bytes
	    found=true
	    ;;
      esac
      ;;
    powerpc|powerpc-linux)
      case "$archive_name" in
        "IBMJava2-SDK-131.ppc.tgz") # SUPPORTED
	    j2se_version=1.3.1${revision}
	    j2se_expected_min_size=51 # 58835697 bytes
	    found=true
	    ;;
        "IBMJava2-SDK-141.ppc.tgz") # SUPPORTED
	    j2se_version=1.4.1${revision}
	    j2se_expected_min_size=49 # 57070530 bytes
	    found=true
	    ;;
        "IBMJava2-SDK-142.ppc.tgz") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=51 # 59313669 bytes
	    found=true
	    ;;
        "ibm-java2-sdk-50-linux-ppc.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=61 # 63942070 bytes
	    found=true
	    ;;
        "ibm-java2-sdk-5.0-6.0-linux-ppc.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=69 # 71512415 bytes
	    found=true
	    ;;
	"ibm-java-sdk-60-linux-ppc32-20070329.tgz" ) # SUPPORTED
	    j2se_version=1.6.0${revision}
	    j2se_expected_min_size=61 # 63942070 bytes
	    found=true
	    ;;
	"ibm-java-sdk-6.0-0.0-linux-ppc.tgz" ) # SUPPORTED
	    j2se_version=1.6.0${revision}
	    j2se_expected_min_size=83 # 87031808 bytes
	    found=true
	    ;;
      esac
      ;;
    powerpc64|powerpc64-linux)
      case "$archive_name" in
        "IBMJava2-SDK-142.ppc64.tgz") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=55
	    found=true
	    ;;   
        "ibm-java2-jre-50-linux-ppc64.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=61 # 63942070 bytes
	    found=true
	    ;;
	"ibm-java-sdk-60-linux-ppc64-20070329.tgz" ) # SUPPORTED
	    j2se_version=1.6.0${revision}
	    j2se_expected_min_size=61 # 63942070 bytes
	    found=true
	    ;;
	"ibm-java-sdk-6.0-0.0-linux-ppc64.tgz" ) # SUPPORTED
	    j2se_version=1.6.0${revision}
	    j2se_expected_min_size=84 # 88080384 bytes
	    found=true
	    ;;
      esac
      ;;
    s390|s390-linux)
      case "$archive_name" in
        "IBMJava2-SDK-131.s390.tgz") # SUPPORTED
	    j2se_version=1.3.1${revision}
	    j2se_expected_min_size=20
	    found=true
	    ;;
        "IBMJava2-SDK-141.s390.tgz") # SUPPORTED
	    j2se_version=1.4.1${revision}
	    j2se_expected_min_size=51
	    found=true
	    ;;
        "IBMJava2-SDK-142.s390.tgz") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=52
	    found=true
	    ;;
        "IBMJava2-SDK-142.s390x.tgz") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=52
	    found=true
	    ;;
        "ibm-java2-sdk-50-s390.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=57 # 59685647 bytes
	    found=true
	    ;;
        "ibm-java2-sdk-50-s390x.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=57 # 59773265 bytes
	    found=true
	    ;;
	"ibm-java-sdk-60-linux-s390-20070329.tgz" ) # SUPPORTED
	    j2se_version=1.6.0${revision}
	    j2se_expected_min_size=61 # 63942070 bytes
	    found=true
	    ;;
	"ibm-java-sdk-6.0-0.0-linux-s390.tgz" ) # SUPPORTED
	    j2se_version=1.6.0${revision}
	    j2se_expected_min_size=80 # 83886080 bytes
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
    IBM Corporation
EOF
    if read_yn "Is this correct [Y/n]: "; then
        j2se_found=true
	j2se_release="${j2se_version:0:3}"
	j2se_required_space=$(( $j2se_expected_min_size * 2 + 20 ))
	j2se_vendor="ibm"
	j2se_title="Java(TM) JDK, Standard Edition, IBM Corporation"
	j2sdk_run
    fi
  fi
}

j2se_detect_ibm_j2sdk=ibm_j2sdk_detect
