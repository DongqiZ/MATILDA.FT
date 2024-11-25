// Copyright (c) 2023 University of Pennsylvania
// Part of MATILDA.FT, released under the GNU Public License version 2 (GPLv2).


#include "include_libs.h"
#include "globals.h"
#include "FTS_Box.h"


void run_fts_sim() {

    std::cout << "In the FTS routine!" << std::endl;

    std::cout << "Number of boxes: " << box.size() << std::endl;

    box[0]->initializeSim();

    for ( int step=0 ; step <= box[0]->maxSteps ; step++ ) {
        box[0]->doTimeStep(step);

        // Check for convergence if SCFT simulation
        if ( step > 50 && box[0]->converged(step) ) {
            std::cout << "Simulation converged! " << std::endl;
            box[0]->renameOutputFiles(step);
            break;
        }

        // Rename output files when maximum steps are reached
        if (step == box[0]->maxSteps) {
            box[0]->renameOutputFiles(step);
        }
    }

    box[0]->writeTime();
}

