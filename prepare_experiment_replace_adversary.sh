#!/bin/bash

# specify the directory paths
directory_paths=(
# "/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_010311-g64eq6sz/files"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_022524-jofmkah7/files"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_033836-gj2a2ycm/files"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_045229-p3wle5fq/files"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_060603-nh3nehsw/files"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_071941-xr7vcx6d/files"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_083303-8n3zvhp2/files"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_094723-n3frm8e1/files"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_110247-bttfdkbl/files"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_121933-f1dva95c/files"
)

# iterate over each directory
for dir in "${directory_paths[@]}"; do
  # check if directory exists
  if [ -d "$dir" ]; then
    echo "Processing $dir..."

    # 0. copy directory and append "_replace_adversary" to its name
    new_dir="${dir}_replace_adversary"
    mkdir -p "$new_dir"
    cp -R "$dir/"* "$new_dir"
    echo "Created a copy of $dir named $new_dir."

    # change to the new directory
    cd "$new_dir"

    # 1. append "_adversary" to the names of files with "0" in their name
    for file in *0*; do
      [ -f "$file" ] || continue
      mv -- "$file" "${file}_adversary"
      echo "Renamed $file to ${file}_adversary."
    done

    for file in *1*; do
      [ -f "$file" ] || continue
      new_file_name="$(echo "$file" | sed 's/1/0/g')"
      cp -- "$file" "$new_file_name"
      echo "Created a copy of $file named $new_file_name."
    done
    # change back to the original directory
    cd -
  else
    echo "Directory $dir does not exist. Skipping."
  fi
done