#!/bin/bash

echo -e "Initializing"
flutter pub get
dart run index_generator
wait
