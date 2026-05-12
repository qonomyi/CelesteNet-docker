# CelesteNet-Docker

Run CelesteNet with Docker

## Setup

1. Clone the repository

   - ```bash
     git clone https://github.com/qonomyi/CelesteNet-docker --recursive
     ```

2. Copy your `FNA.dll` to `./lib-stripped`

3. Build and run

   - ```bash
     docker compose up --build
     ```

4. Stop container after started, then Edit configs in `persist/celestenet-config.yaml`, `persist/ModuleConfigs`
   - You **MUST** change `Password`, `PasswordExec` in `ModuleConfigs/~.FrontendModule.yaml` before expose.

5. thats it now just works enjoy cya
