#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_DIR="$(dirname "$SCRIPT_DIR")"
SNAPSHOT_DIR="$PACKAGES_DIR/__snapshot"

echo ""
echo "###############"
echo "#   rpm-gpg   #"
echo "###############"
echo ""

diff <(rpm -qa --qf "%{NAME}-%{VERSION}-%{RELEASE} %{SUMMARY}\n" gpg-pubkey | sort) <(cat "$SNAPSHOT_DIR/rpm.keys.csv")

echo ""
echo "###############"
echo "#  dnf-repos  #"
echo "###############"
echo ""

diff <(dnf repolist --enabled) <(cat "$SNAPSHOT_DIR/dnf-repos.txt")

echo ""
echo "###############"
echo "#     dnf     #"
echo "###############"
echo ""

diff <(dnf repoquery --userinstalled --qf "%{name}\n" | sort -u) <(cat "$SNAPSHOT_DIR/dnf.csv")

echo ""
echo "###############"
echo "#    conda    #"
echo "###############"
echo ""

conda compare -n root "$SNAPSHOT_DIR/conda-env.yml"
echo "  -------------"
diff <(conda env export -n root --from-history --no-builds) <(cat "$SNAPSHOT_DIR/conda-env.yml")
