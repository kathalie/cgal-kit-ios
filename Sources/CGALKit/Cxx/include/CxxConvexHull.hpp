//
//  CxxConvexHull.hpp
//  
//
//  Created by Kathryn Verkhogliad on 19.11.2024.
//

#pragma once

// IMPORTANT: Disables usage of GMP and allows only Boost as multiprecision backend.
#define CMAKE_OVERRIDDEN_DEFAULT_ENT_BACKEND BOOST_BACKEND

double computeVolume(double** points, unsigned nPoints);
