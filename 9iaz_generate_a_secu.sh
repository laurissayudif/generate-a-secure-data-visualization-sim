#!/bin/bash

# Function to generate random data
generate_data() {
  echo "Generating random data..."
  for i in {1..10}; do
    rand_num=$(openssl rand -base64 12)
    echo "$rand_num" >> data.txt
  done
}

# Function to visualize data using gnuplot
visualize_data() {
  echo "Visualizing data..."
  gnuplot -e "set terminal png; set output 'data.png'; plot 'data.txt' with linespoints"
}

# Function to encrypt data using openssl
encrypt_data() {
  echo "Encrypting data..."
  openssl enc -aes-256-cbc -in data.txt -out encrypted_data.txt -pass pass:my_secret_password
}

# Main function
main() {
  generate_data
  visualize_data
  encrypt_data
}

# Run the main function
main