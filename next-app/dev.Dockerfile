FROM node:18-alpine

WORKDIR /app

# Install dependencies based on the preferred package manager
COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* ./
RUN \
  if [ -f yarn.lock ]; then yarn --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm ci; \
  elif [ -f pnpm-lock.yaml ]; then yarn global add pnpm && pnpm i; \
  # Allow install without lockfile, so example works even without Node.js installed locally
  else echo "Warning: Lockfile not found. It is recommended to commit lockfiles to version control." && yarn install; \
  fi

COPY public ./public
COPY app ./app
COPY components ./components

COPY .eslintrc.json .
COPY next-env.d.ts .
COPY next.config.js .
COPY package.json .
# COPY package-lock.json .
COPY postcss.config.js .
COPY tailwind.config.ts .
COPY tsconfig.json .

# COPY next.config.js .
# COPY tsconfig.json .

# Next.js collects completely anonymous telemetry data about general usage. Learn more here: https://nextjs.org/telemetry
# Uncomment the following line to disable telemetry at run time
# ENV NEXT_TELEMETRY_DISABLED 1

# Note: Don't expose ports here, Compose will handle that for us

# Start Next.js in development mode based on the preferred package manager
# CMD \
#   if [ -f yarn.lock ]; then yarn dev; \
#   elif [ -f package-lock.json ]; then npm run dev; \
#   elif [ -f pnpm-lock.yaml ]; then pnpm dev; \
#   else yarn dev; \
#   fi

CMD \
  if [ -f yarn.lock ]; then yarn dev; \
  elif [ -f package-lock.json ]; then npm run build && npm start; \
  elif [ -f pnpm-lock.yaml ]; then pnpm dev; \
  else yarn dev; \
  fi