# Brand
SELECT COUNT(*), CHAR_LENGTH(BrandDescription) AS BrandNameLength FROM CF01_Brand GROUP BY BrandNameLength;
SELECT COUNT(*), CHAR_LENGTH(ProductWebSite) AS BrandSiteLength FROM CF01_Brand GROUP BY BrandSiteLength;

# Labeler
SELECT COUNT(*), CHAR_LENGTH(LabelerName) AS LabelerNameLength FROM CF01_Labeler GROUP BY LabelerNameLength;

# Company
SELECT COUNT(*), CHAR_LENGTH(CompanyName) AS CompanyNameLength FROM CF01_Company GROUP BY CompanyNameLength;

# Table stats
SHOW TABLE STATUS;