FROM node:lts as build

RUN mkdir /callcenter-ai
COPY . /callcenter-ai

WORKDIR /callcenter-ai
RUN npm install -g pnpm
RUN pnpm i
RUN pnpm run build

FROM nginx
COPY --from=build callcenter-ai/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/callcenter-ai.conf
# EXPOSE 8000 # ! not required as 80 is already exposed.

CMD ["nginx", "-g", "daemon off;"]