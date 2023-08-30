FROM mcr.microsoft.com/windows:ltsc2019
COPY install.cmd C:\\install.cmd
#ADD https://get.enterprisedb.com/postgresql/postgresql-15.2-2-windows-x64.exe C:\\postgresql-15.2-2-windows-x64.exe
COPY postgresql-15.2-2-windows-x64.exe C:\\postgresql-15.2-2-windows-x64.exe
WORKDIR C:\\
ARG POSTGRES_PASSWORD postgres
ARG POSTGRES_USERNAME postgres
RUN install.cmd
RUN del postgresql-15.2-2-windows-x64.exe && del install.cmd
COPY start.cmd C:\\start.cmd
RUN echo host	all	all	0.0.0.0/0	scram-sha-256>>"C:\Program Files\PostgreSQL\15\data\pg_hba.conf"
RUN echo.>>"C:\Program Files\PostgreSQL\15\data\pg_hba.conf"
RUN echo host	all	all	::0/0	scram-sha-256>>"C:\Program Files\PostgreSQL\15\data\pg_hba.conf"
ENTRYPOINT ["C:\\start.cmd "]
