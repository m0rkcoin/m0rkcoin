// Copyright (c) 2012-2017, The CryptoNote developers, The Bytecoin developers
//
// This file is part of m0rkcoin.
//
// m0rkcoin is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// m0rkcoin is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with m0rkcoin.  If not, see <http://www.gnu.org/licenses/>.

#pragma once

#include <vector>

#include "CryptoNoteCore/ITransactionPool.h"

namespace Crypto {
struct Hash;
}

namespace CryptoNote {

class ITransactionPoolCleanWrapper: public ITransactionPool {
public:
  virtual ~ITransactionPoolCleanWrapper() {}

  virtual std::vector<Crypto::Hash> clean() = 0;
};

} //namespace CryptoNote
