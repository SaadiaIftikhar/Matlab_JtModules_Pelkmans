function [ output_args ] = debug_secondary( input_args )
close all; clear all; clc

dir1 = '/Users/saadiaiftikhar/Documents/Markus_Data_Samples/';
image_filename = 'p00_D03_y000_x000_t000_c004_z000.tif';
image_file = fullfile(dir1, image_filename);
image = uint16(imread(image_file));

input_image = double(image) ./ 2^16;
input_image = input_image(1:511,1:511);

correction_factors = [2, 1.5, 1.3, 0.9, 0.7, 0.6, 0.58, 0.55, 0.50, 0.45, 0.4, 0.35, 0.3, 0.25];
min_treshold = 0;
max_treshold = 1;

mask_filename = 'Results/p00_D03_y000_x000_t000_c002_z000_Output_Image.tif';
mask_file = fullfile(dir1, mask_filename);
mask = imread(mask_file);
% mask = mask(1:512,1:512);

import jtlib.*;
out = jtlib.segmentSecondary(input_image, mask, mask, correction_factors, min_treshold, max_treshold);
end

