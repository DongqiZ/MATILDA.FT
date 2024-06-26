// Copyright (c) 2023 University of Pennsylvania
// Part of MATILDA.FT, released under the GNU Public License version 2 (GPLv2).


#include "potential.h"

#ifndef _PAIR_BIASFIELD
#define _PAIR_BIASFIELD


// This class is of type Potential and inherits all Potential
// routines. Potential is initialized first, then the Gaussian
// initialization is performed.
class BiasField : public Potential {
private:
	static int num;
public:
    BiasField();
    BiasField(std::istringstream&);
    ~BiasField();
protected:
    void Initialize();
	void CalcForces();
    void CalcVirial() override {}
    void ReportEnergies(int&)  override;
    void Update() override;

    int n_periods, dir, phase;
    float * d_master_u, *d_master_f;
};



#endif