#include "../src/ann/ann.hpp"
#include <iostream>
#include <thrust/version.h>

int main (void)
{
    std::cout << "Thrust v" << THRUST_MAJOR_VERSION << "." << THRUST_MINOR_VERSION << std::endl;

    // XOR Example
    // Create a XOR Network: 2 input, 2 hidden neurons, 1 hidden layer, 1 output neurons
    cuANN::ann xor_net = cuANN::ann(  2, 2, 1, 1 );
    cuANN::data train_data = cuANN::data( "xor.data" );

    float x[2] {1.f, -1.f};
    thrust::device_vector<float> in_vec( x, x + 2 );
    thrust::host_vector<float> output = xor_net.propagate( in_vec );

    return 0;
}
