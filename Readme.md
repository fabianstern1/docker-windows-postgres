**Docker for Windows Postgres 15**

This files can be used to create a working Docker Postgres 15 Image for Windows.
Default username postgres
Default password postgres
Port 5432
Listening IPv4 and IPv6 FOR ALL HOSTS

**Dockerfile for Windows Postgres**

1. Download executable postgresql-15.2-2-windows-x64.exe at https://www.enterprisedb.com/postgresql-tutorial-resources-training-1?uuid=7b1a8f61-1469-4f8a-959e-e22e97e06691&campaignId=Product_Trial_PostgreSQL_15
2. Place postgresql-15.2-2-windows-x64.exe in the same path as Dockerfile
3. Run build "docker build -t postgres --build-arg POSTGRES_USERNAME=postgres --build-arg POSTGRES_PASSWORD=postgres ."

**Known issues**

1. Username and Password can only be set during "docker build ..."
2. No healthchecks