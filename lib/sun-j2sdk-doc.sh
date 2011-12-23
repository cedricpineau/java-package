# Detect product
function sun_j2sdk_doc_detect() {
  local found=
      case "$archive_name" in
	"j2sdk-1_3_1-doc.zip") # SUPPORTED
	    j2se_version=1.3.1${revision}
	    j2se_expected_min_size=22 # 22049 kB
	    found=true
	    ;;
	"j2sdk-1_4_2-doc.zip") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=33 # 33592 kB
	    found=true
	    ;;
	"j2sdk-1_4_2-doc-ja.zip") # SUPPORTED
	    j2se_version=1.4.2${revision}
	    j2se_expected_min_size=87 # 89150 kB
	    found=true
	    ;;
	"jdk-1_5_0-doc.zip") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=46 # 46386 kB
	    found=true
	    ;;
	"jdk-1_5_0-doc-ja.zip") # SUPPORTED
	    j2se_version=1.5.0${revision}
	    j2se_expected_min_size=44 # 44566 kB
	    found=true
	    ;;
	"jdk-6-doc.zip") # SUPPORTED
	    j2se_version=1.6.0${revision}
	    j2se_expected_min_size=44 # 44566 kB
	    found=true
	    ;;
      esac
  if [[ -n "$found" ]]; then
	cat << EOF

Detected product:
    Java(TM) Development Kit (JDK) Documentation
    Standard Edition, Version $j2se_version
    Sun Microsystems(TM), Inc.
EOF
	if read_yn "Is this correct [Y/n]: "; then
	    j2se_found=true
	    j2se_release="${j2se_version:0:3}"
	    j2se_required_space=$(( $j2se_expected_min_size * 2 + 20 ))
	    j2se_vendor="sun"
	    j2se_title="Java(TM) JDK, Standard Edition, Sun Microsystems(TM) Documentation"
	    j2sdk_doc_run
	fi
    fi
}

j2se_detect_j2sdk_doc_sun=sun_j2sdk_doc_detect
