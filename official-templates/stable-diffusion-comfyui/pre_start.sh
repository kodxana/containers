#!/bin/bash

export PYTHONUNBUFFERED=1
echo 'syncing to workspace, please wait'
rsync -au --remove-source-files /venv/ /workspace/venv/
echo 'syncing ComfyUI to workspace, please wait'
rsync -au --remove-source-files /ComfyUI/ /workspace/ComfyUI/
ln -s /comfy-models/* /workspace/ComfyUI/models/checkpoints/

source /workspace/venv/bin/activate

cd /workspace/ComfyUI
exec /workspace/venv/bin/python main.py --listen --port 3000 &
