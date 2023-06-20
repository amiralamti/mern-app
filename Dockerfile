# Stage1: UI Build
FROM node:14-slim AS ui-build
WORKDIR /usr/src
COPY ui/ ./ui/
RUN cd ui && npm install && npm run build
EXPOSE 3000
CMD ["npm", "start"]

# Stage2: API Build
FROM node:14-slim AS api-build
WORKDIR /usr/src
COPY api/ ./api/
RUN cd api && npm install && ENVIRONMENT=production npm run build
RUN ls
EXPOSE 3080
CMD ["npm", "run", "dev"]
