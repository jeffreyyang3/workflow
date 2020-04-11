from node:alpine 
workdir '/app'
copy package.json ./
run npm install
copy . .
run npm run build

from nginx
expose 80
copy --from=0 /app/build /usr/share/nginx/html
