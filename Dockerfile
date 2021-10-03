FROM node:lts
WORKDIR /root
RUN apt update \
 && apt install -y curl \
 && npm i -g npm \
 && rm -rf /var/lib/apt/lists/*
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN cargo install wrangler wasm-pack worker-build \
 && rm -rf ~/.cargo/registry
COPY . .
RUN npm i --production
