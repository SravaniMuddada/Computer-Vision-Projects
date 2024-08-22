# Computer-Vision-Experiments

Welcome to the **Computer-Vision-Experiments** repository. This repository contains a collection of computer vision projects focusing on image processing techniques, including denoising, deblurring, image segmentation, and color classification using clustering algorithms. Below are detailed descriptions of the projects included in this repository.

## Project 1: Denoising and Deblurring using Spatial and Frequency Domain Filtering Techniques

### Overview
This project implements various filtering techniques in both the spatial and frequency domains to address image noise and blur challenges. The goal is to restore images by removing noise and blur while preserving the original image details.

### Techniques Used

- **Spatial Domain Filtering:**
  - **Linear Filters:**
    - **Average Filter:** A simple filter that reduces noise by averaging pixel values in a neighborhood.
    - **Weighted Average Filter:** A variation of the average filter where pixels are weighted differently, giving more importance to certain pixels.
    - **Arithmetic Mean Filter:** Calculates the mean of the pixel values in a defined neighborhood.
    - **Geometric Mean Filter:** Uses the product of pixel values raised to the power of 1/n (where n is the number of pixels) to reduce noise while preserving edges.

  - **Non-Linear Filters:**
    - **Minimum Filter:** Replaces each pixel with the minimum value in its neighborhood, useful for removing bright noise.
    - **Maximum Filter:** Replaces each pixel with the maximum value in its neighborhood, effective for enhancing bright regions.
    - **Median Filter:** Replaces each pixel with the median value of neighboring pixels, effective in removing salt-and-pepper noise.
    - **Alpha-Trimmed Mean Filter:** A hybrid filter that trims a certain number of the highest and lowest pixel values before averaging the remaining pixels, balancing noise reduction and edge preservation.

- **Frequency Domain Filtering:**
  - **Ideal Low-Pass Filter (ILPF):** Removes high-frequency components, effectively blurring the image.
  - **Butterworth Filter:** A smoother filter compared to ILPF, with a more gradual transition between low and high frequencies.
  - **Gaussian Filter:** A filter that applies a Gaussian function in the frequency domain, providing smooth blurring while preserving important image details.

### Evaluation Metrics
To evaluate the effectiveness of each filtering technique, we calculated the following metrics:
- **Mean Squared Error (MSE):** Measures the average squared difference between the original and processed images. Lower values indicate better performance.
- **Peak Signal-to-Noise Ratio (PSNR):** Indicates the ratio between the maximum possible power of a signal and the power of corrupting noise. Higher values indicate better image quality.

### Results
The results showed that different filters perform better depending on the type of noise or blur in the image. MSE and PSNR values were calculated for each filter to quantify their performance.

## Project 2: Image Segmentation using Global Thresholding (Otsu's Method)

### Overview
Image segmentation is a crucial step in image analysis, where the goal is to partition an image into meaningful regions. In this project, we applied global thresholding using Otsu's method to separate objects from the background.

### Technique Used
- **Otsu's Method:** A global thresholding technique that automatically determines the optimal threshold value by maximizing the between-class variance. This method is particularly effective for images with a bimodal histogram.

### Process
1. The image histogram was analyzed to identify the two peaks corresponding to the foreground and background.
2. Otsu's method was applied to calculate the optimal threshold value.
3. The image was segmented into binary regions based on the calculated threshold.

### Results
The segmented images showed clear separation between the objects and the background, demonstrating the effectiveness of Otsu's method in image segmentation.

## Project 3: Image Classification using K-Means Clustering

### Overview
In this project, we applied the K-Means clustering algorithm to classify the colors in an image. The goal was to group similar colors into clusters and observe how increasing the number of clusters (K value) affects the classification.

- **K-Means Clustering:**
  - **Initialization:** Randomly selects K initial cluster centroids.
  - **Iteration:** Assigns each pixel to the nearest centroid and recalculates the centroids based on the mean of the assigned pixels.
  - **Convergence:** Repeats the iteration until the centroids no longer change significantly.

### Process
1. The image was converted to the RGB color space.
2. The K-Means clustering algorithm was applied with different values of K (number of clusters).
3. The classified image was observed for varying K values to understand how the algorithm groups similar colors.

### Observations
- As the K value increased, the algorithm classified more distinct classes of colors, resulting in finer segmentation of the image.
- For small K values, broader color groups were observed, while higher K values led to more detailed color separation.

## Conclusion
These projects demonstrate key concepts in computer vision, including image restoration, segmentation, and color classification. Each project includes code implementations, visual results, and detailed explanations of the techniques used.

## How to Run
1. Clone this repository: `git clone https://github.com/SravaniMuddada/Computer-Vision-Experiments.git`
2. Navigate to the project directory.
3. Run the MATLAB scripts provided for each project to explore the implementations and results.

## Dependencies
- MATLAB R2020a or later


