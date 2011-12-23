# Detect product
function ibm_j2re_detect() {
  local found=
  
  case "${DEB_BUILD_ARCH:-$DEB_BUILD_GNU_TYPE}" in
    i386|i486-linux-gnu)
      case "$archive_name" in
        "IBMJava2-JRE-131.tgz") # SUPPORTED
	    j2se_version=1.3.1${revision}
	    j2se_expected_min_size=20 #  bytes
	    found=true
	    ;;
        "IBMJava2-JRE-142.tgz") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=37 #  bytes
	    found=true
	    ;;
        "ibm-java2-jre-50-linux-i386.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=40 # 41655352 bytes
	    found=true
	    ;;
      esac
      ;;
    amd64|x86_64-linux-gnu)
      case "$archive_name" in
        "IBMJava2-JRE-AMD64-142.x86_64.tgz") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=37
	    found=true
	    ;;
        "ibm-java2-jre-50-linux-x86_64.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=46 # 48018851 bytes
	    found=true
	    ;;
      esac
      ;;
    powerpc|powerpc-linux)
      case "$archive_name" in
        "IBMJava2-JRE-131.ppc.tgz") # SUPPORTED
	    j2se_version=1.3.1${revision}
	    j2se_expected_min_size=20 #  bytes
	    found=true
	    ;;
        "IBMJava2-JRE-142.ppc.tgz") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=40 #  bytes
	    found=true
	    ;;
        "ibm-java2-jre-50-linux-ppc.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=42 # 43687702 bytes
	    found=true
	    ;;
	"ibm-java2-jre-5.0-5.0-linux-ppc.tgz") # SUPPORTED
            j2se_version=1.5.0${revision}
            j2se_expected_min_size=50 # 50066027 bytes
            found=true
            ;;
      esac
      ;;
    powerpc64|powerpc64-linux)
      case "$archive_name" in
        "IBMJava2-JRE-142.ppc64.tgz") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=37
	    found=true
	    ;;
        "ibm-java2-jre-50-linux-ppc64.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=46 # 47734431 bytes
	    found=true
	    ;;
      esac
      ;;
    s390|s390-linux)
      case "$archive_name" in
        "IBMJava2-JRE-131.s390.tgz") # SUPPORTED
	    j2se_version=1.3.1${revision}
	    j2se_expected_min_size=20
	    found=true
	    ;;
        "IBMJava2-JRE-141.s390.tgz") # SUPPORTED
	    j2se_version=1.4.1${revision}
	    j2se_expected_min_size=31
	    found=true
	    ;;
        "IBMJava2-JRE-142.s390.tgz") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=34
	    found=true
	    ;;
        "IBMJava2-JRE-142.s390x.tgz") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=34
	    found=true
	    ;;
        "ibm-java2-jre-50-s390.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=42 # 43686815 bytes
	    found=true
	    ;;
        "ibm-java2-jre-50-s390x.tgz") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=42 # 43773066 bytes
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
    IBM Corporation
EOF
	if read_yn "Is this correct [Y/n]: "; then
	    j2se_found=true
	    j2se_release="${j2se_version:0:3}"
	    j2se_required_space=$(( $j2se_expected_min_size * 2 + 20 ))
	    j2se_vendor="ibm"
	    j2se_title="Java(TM) JRE, Standard Edition, IBM Corporation"
	    j2re_run
 	fi
    fi
}

j2se_detect_ibm_j2re=ibm_j2re_detect
