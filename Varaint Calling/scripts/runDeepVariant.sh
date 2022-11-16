#!/usr/bin/env bash
# runDeepVariant.sh


set -euo pipefail

BASE="/mnt/disks/sdb/binf6309-julianstanley/VariantCalling"
BIN_VERSION="0.8.0"

INPUT_DIR="${BASE}/input/data"
REF="GRCh38_reference.fa.gz"
BAM="SRR6808334.bam.sorted"

N_SHARDS="64"

OUTPUT_DIR="${BASE}/output"
OUTPUT_VCF="SRR6808334.output.vcf.gz"
OUTPUT_GVCF="SRR6808334.output.vcf.gz"
LOG_DIR="${OUTPUT_DIR}/logs"

## Create directory structure
mkdir -p "${OUTPUT_DIR}"
mkdir -p "${INPUT_DIR}"
mkdir -p "${LOG_DIR}"

## Downloads
sudo apt-get -qq -y update

if ! hash docker 2>/dev/null; then
      echo "'docker' was not found in PATH. Installing docker..."
      # Install docker using instructions on:
      # https://docs.docker.com/install/linux/docker-ce/ubuntu/
      sudo apt-get -qq -y install \
          apt-transport-https \
          ca-certificates \
          curl \
          gnupg-agent \
          software-properties-common
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
      sudo add-apt-repository \
          "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
          $(lsb_release -cs) \
          stable"
      sudo apt-get -qq -y update
      sudo apt-get -qq -y install docker-ce
fi

# Copy the data
echo "Copying data"
cp SRR6808334.bam.sorted -d "${INPUT_DIR}"
cp SRR6808334.bai -d "${INPUT_DIR}"
cp GRCh38_reference.fa.gz -d "${INPUT_DIR}"
cp GRCh38_reference.fa.gz.gzi -d "${INPUT_DIR}"
cp GRCh38_reference.fa.gz.fai -d "${INPUT_DIR}"

## Pull the docker image.
sudo docker pull gcr.io/deepvariant-docker/deepvariant:"${BIN_VERSION}"

echo "Running DeepVariant..."
sudo docker run \
      -v "${INPUT_DIR}":"/input" \
      -v "${OUTPUT_DIR}:/output" \
      gcr.io/deepvariant-docker/deepvariant:"${BIN_VERSION}" \
      /opt/deepvariant/bin/run_deepvariant \
      --model_type=WGS \
      --ref="/input/${REF}" \
      --reads="/input/${BAM}" \
      --output_vcf=/output/${OUTPUT_VCF} \
      --output_gvcf=/output/${OUTPUT_GVCF} \
      --num_shards=${N_SHARDS}
echo "Done."
echo
