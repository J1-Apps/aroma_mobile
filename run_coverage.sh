#!/bin/bash

flutter test --coverage
lcov --remove coverage/lcov.info 'lib/presentation/util/localization/*' -o coverage/lcov.info