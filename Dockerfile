FROM node:16 
COPY server.js ./
EXPOSE 8080
CMD ["npm","start"]
