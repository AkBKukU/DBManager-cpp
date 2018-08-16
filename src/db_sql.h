#ifndef DB_REL_H
#define DB_REL_H

#include <string>

class DBSQL {

	public:
		void setCredentials(
			std::string server,
			std::string database,
			std::string user,
			std::string password
		);



	private:
		virtual bool connect();
		virtual bool disconnect();

		std::string server, database, user, password;


};

#endif
