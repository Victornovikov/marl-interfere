#!/bin/sh
env="MPE"
scenario="simple_tag"  #https://pettingzoo.farama.org/environments/mpe/simple_push/
num_landmarks=4
num_agents=5
num_good_agents=4
num_adversaries=1
algo="rmappo" #"mappo" "ippo"
exp="swap"
seed_max=1
# share_policy=True
share_policy=False
model_dir="results/MPE/simple_tag/rmappo/train/wandb/run-20230607_112850-krd38n1o/files"

echo "env is ${env}, scenario is ${scenario}, algo is ${algo}, exp is ${exp}, max seed is ${seed_max}"
for seed in `seq ${seed_max}`;
do
    echo "seed is ${seed}:"
    CUDA_VISIBLE_DEVICES=0 python train_mpe.py --env_name ${env} --algorithm_name ${algo} --experiment_name ${exp} \
    --scenario_name ${scenario} --num_agents ${num_agents} --num_landmarks ${num_landmarks} --seed ${seed} \
    --share_policy ${share_policy} --n_training_threads 1 --n_rollout_threads 128 --num_mini_batch 1 \
    --episode_length 25 --num_env_steps 20000000 --ppo_epoch 10 --use_ReLU --gain 0.01 --lr 7e-4 \
    --critic_lr 7e-4 --wandb_name "swap" --user_name "victornovikov" \
    --swap \
    --use_centralized_V "True"\
    --model_dir ${model_dir}
done    