#!/bin/sh
env="MPE"
scenario="simple_push"  #https://pettingzoo.farama.org/environments/mpe/simple_push/
num_landmarks=1
num_agents=2
algo="rmappo" #"mappo" "ippo"
exp="check"
seed_max=1
# share_policy=True
share_policy=False

echo "env is ${env}, scenario is ${scenario}, algo is ${algo}, exp is ${exp}, max seed is ${seed_max}"
for seed in `seq ${seed_max}`;
do
    echo "seed is ${seed}:"
    CUDA_VISIBLE_DEVICES=0 python train_mpe.py --env_name ${env} --algorithm_name ${algo} --experiment_name ${exp} \
    --scenario_name ${scenario} --num_agents ${num_agents} --num_landmarks ${num_landmarks} --seed ${seed} \
    --share_policy ${share_policy} --n_training_threads 1 --n_rollout_threads 128 --num_mini_batch 1 \
    --episode_length 25 --num_env_steps 20000000 --ppo_epoch 10 --use_ReLU --gain 0.01 --lr 7e-4 \
    --critic_lr 7e-4 --wandb_name "xxx" --user_name "victornovikov" --swap
done    