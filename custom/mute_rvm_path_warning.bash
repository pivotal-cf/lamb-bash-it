#!/bin/bash
if ! grep -Fxq "rvm_silence_path_mismatch_check_flag=1" ~/.rvmrc
then
    echo 'rvm_silence_path_mismatch_check_flag=1' >> ~/.rvmrc    
fi
