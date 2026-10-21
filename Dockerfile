FROM nginx:alpine

# The nginx image renders /etc/nginx/templates/*.template with envsubst at startup,
# so the server can listen on the PORT Render injects (default 10000).
RUN printf 'server {\n  listen ${PORT};\n  root /usr/share/nginx/html;\n  index index.html;\n  location / { try_files $uri /index.html; }\n}\n' \
    > /etc/nginx/templates/default.conf.template

COPY radar-higiexpo-2026.html /usr/share/nginx/html/index.html

ENV PORT=10000
EXPOSE 10000
