#ifndef _FLOKICOIN_H_
#define _FLOKICOIN_H_ 1

#include "protocol.h"

bool TestNode(const CService &cip, int &ban, int &client, std::string &clientSV, int &blocks, std::vector<CAddress>* vAddr, uint64_t& services);

#endif
