# Cloudinary Setup Guide

## Step 1: Create a Cloudinary Account

1. Go to [https://cloudinary.com/](https://cloudinary.com/)
2. Click "Sign Up" if you don't have an account
3. Use the free tier (it's sufficient for development)

## Step 2: Get Your Credentials

1. After signing up/logging in, you'll be on the Dashboard
2. You'll see a section called "Account Details" or "API Environment variable"
3. Copy the following values:
    - **Cloud Name**: This is your unique cloud name
    - **API Key**: A long number (like 123456789012345)
    - **API Secret**: A string of letters and numbers

## Step 3: Update Your .env File

Replace the placeholder values in your `.env` file:

```env
CLOUDINARY_CLOUD_NAME=your_actual_cloud_name_here
CLOUDINARY_API_KEY=your_actual_api_key_here
CLOUDINARY_API_SECRET=your_actual_api_secret_here
```

## Step 4: Restart Your Server

After updating the .env file, restart your Node.js server:

```bash
npm start
# or
node src/index.js
```

## Step 5: Test the Connection

Test if Cloudinary is working:

```bash
curl http://localhost:8000/api/v1/video/test-cloudinary
```

You should see a success message instead of an API key error.

## Troubleshooting

-   Make sure there are no spaces around the `=` sign in your .env file
-   Make sure your .env file is in the root directory of your project
-   Make sure to restart your server after changing .env variables
-   Double-check that you copied the credentials correctly from Cloudinary dashboard

## Security Note

-   Never commit your real API credentials to version control
-   Add `.env` to your `.gitignore` file
-   Use environment variables in production
