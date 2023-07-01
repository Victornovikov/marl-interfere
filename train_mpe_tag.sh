#!/bin/sh
env="MPE"
scenario="simple_tag"  #https://pettingzoo.farama.org/environments/mpe/simple_push/
num_landmarks=4
num_agents=4
num_good_agents=1
num_adversaries=3
algo="rmappo" #"mappo" "ippo"
exp="train3v1_15M"
seed_max=10

#note! when share_policy is SET, agent use different policies
#note! when _use_centralized_V is SET, centralized_V is NOT used

echo "env is ${env}, scenario is ${scenario}, algo is ${algo}, exp is ${exp}, max seed is ${seed_max}"
for seed in `seq ${seed_max}`;
do
    echo "seed is ${seed}:"
    CUDA_VISIBLE_DEVICES=0 python3 train_mpe.py --env_name ${env} --algorithm_name ${algo} --experiment_name ${exp} \
    --scenario_name ${scenario} --num_agents ${num_agents} --num_landmarks ${num_landmarks} --seed ${seed} \
    --num_good_agents ${num_good_agents} --num_adversaries ${num_adversaries} \
    --share_policy --n_training_threads 1 --n_rollout_threads 128 --num_mini_batch 1 \
    --episode_length 25 --num_env_steps 15000000 --ppo_epoch 10 --use_ReLU --gain 0.01 --lr 7e-4 \
    --critic_lr 7e-4 --wandb_name "swap" --user_name "victornovikov" \
    --use_centralized_V 
done    