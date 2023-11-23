SELECT current_database() AS database_name,
       current_user AS username,
       inet_server_addr() AS host_address;