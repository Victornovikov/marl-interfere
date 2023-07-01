#!/bin/sh
env="MPE"
scenario="simple_tag"  #https://pettingzoo.farama.org/environments/mpe/simple_push/
num_landmarks=4
num_agents=5
num_good_agents=4
num_adversaries=1
algo="rmappo" #"mappo" "ippo"
exp="swap_adversary"
seed_max=10

# model_dir="results/MPE/simple_tag/rmappo/train/wandb/run-20230621_015418-fuj8fihw/files"
# model_dir="results/MPE/simple_tag/rmappo/train/wandb/run-20230622_011540-4e3j8tel/files"
# model_dir="results/MPE/simple_tag/rmappo/train/wandb/run-20230622_031905-yjtiinrk/files"
# model_dir="results/MPE/simple_tag/rmappo/train/wandb/run-20230622_052412-1b4dpmxr/files"
# model_dir="results/MPE/simple_tag/rmappo/train/wandb/run-20230622_072314-ftjt4f4g/files"
# model_dir="results/MPE/simple_tag/rmappo/train/wandb/run-20230622_092130-3au09uuq/files"

# echo "env is ${env}, scenario is ${scenario}, algo is ${algo}, exp is ${exp}, max seed is ${seed_max}"
# for seed in `seq ${seed_max}`;
# do
#     echo "seed is ${seed}:"
#     CUDA_VISIBLE_DEVICES=0 python train_mpe.py --env_name ${env} --algorithm_name ${algo} --experiment_name ${exp} \
#     --scenario_name ${scenario} --num_agents ${num_agents} --num_landmarks ${num_landmarks} --seed ${seed} \
#     --share_policy ${share_policy} --n_training_threads 1 --n_rollout_threads 128 --num_mini_batch 1 \
#     --episode_length 25 --num_env_steps 20000000 --ppo_epoch 10 --use_ReLU --gain 0.01 --lr 7e-4 \
#     --critic_lr 7e-4 --wandb_name "swap" --user_name "victornovikov" \
#     --swap \
#     --use_centralized_V "True"\
#     --model_dir ${model_dir}
# done    

array_of_paths=(
# "/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_010311-g64eq6sz/files_replace_adversary"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_022524-jofmkah7/files_replace_adversary"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_033836-gj2a2ycm/files_replace_adversary"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_045229-p3wle5fq/files_replace_adversary"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_060603-nh3nehsw/files_replace_adversary"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_071941-xr7vcx6d/files_replace_adversary"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_083303-8n3zvhp2/files_replace_adversary"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_094723-n3frm8e1/files_replace_adversary"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_110247-bttfdkbl/files_replace_adversary"
"/home/vn/marl-interfere/results/MPE/simple_tag/rmappo/train/wandb/run-20230627_121933-f1dva95c/files_replace_adversary"
)

echo "env is ${env}, scenario is ${scenario}, algo is ${algo}, exp is ${exp}, max seed is ${seed_max}"
for (( i=0; i<${seed_max}; i++ ));
do
    seed=$(( i + 1 ))  # adjust this if your seeds start from a number other than 1
    model_dir=${array_of_paths[i]}
    echo "seed is ${seed}:"
    echo "model_dir is ${model_dir}"    
    CUDA_VISIBLE_DEVICES=0 python3 train_mpe.py --env_name ${env} --algorithm_name ${algo} --experiment_name ${exp} \
    --scenario_name ${scenario} --num_agents ${num_agents} --num_landmarks ${num_landmarks} --seed ${seed} \
    --share_policy --n_training_threads 1 --n_rollout_threads 128 --num_mini_batch 1 \
    --episode_length 25 --num_env_steps 15000000 --ppo_epoch 10 --use_ReLU --gain 0.01 --lr 7e-4 \
    --critic_lr 7e-4 --wandb_name "swap" --user_name "victornovikov" \
    --swap \
    --use_centralized_V \
    --model_dir ${model_dir}
done