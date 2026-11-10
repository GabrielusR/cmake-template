#include <iostream>

#include "logging.h"

int main() {

	ErrObj failed{};
	
	failed.code = {ErrCode::Err1};
	failed.status = {"Not found"};

	PRINT("PRINT funciona!");

	LOG("LOG funciona!");

	DEBUG("DEBUG");

	ERR(failed);

	return 0;
}
