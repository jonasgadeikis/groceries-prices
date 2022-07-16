-- Update single column for table entry

UPDATE `product`
SET `name` = 'Juoda AGOTOS duona, 800g'
WHERE `name` = 'Juoda AGOTOS duona, 700g';

-- Update multiple columns for table entry

UPDATE `product`
SET `name` = 'Juoda AGOTOS duona, 800g',
    `photo_url` = 'https://rimibaltic-res.cloudinary.com/image/upload/b_white,c_fit,f_auto,h_480,q_auto,w_480/d_ecommerce:backend-fallback.png/MAT_253013_PCE_LT'
WHERE `name` = 'Juoda AGOTOS duona, 700g';
