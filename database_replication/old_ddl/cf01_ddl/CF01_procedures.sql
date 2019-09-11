DELIMITER $$
CREATE PROCEDURE `CF01_AUDIT_SUM_2512_By_Id_SP`(IN `_CosmeticFormulationId` INT)
    NO SQL
select `cf`.`CosmeticFormulationId` AS `CosmeticFormulationId`,
`cf`.`StatusId` AS `StatusId`,
`status`.`StatusDescription` AS `StatusDescription`,
`cf`.`RegistrationNumber` AS `RegistrationNumber`,
`labeler`.`LabelerName` AS `LabelerName`,
`cf`.`LabelerType` AS `LabelerType`,
`addressl`.`StreetAddress` AS `LabelerStreetAddress`,
`addressl`.`City` AS `LabelerCity`,
(case when isnull(`statel`.`StateName`) then `addressl`.`OptionalState` else `statel`.`StateName` end) AS `LabelerStateName`,
`addressl`.`PostalCode` AS `LabelerPostalCode`,
`countryl`.`CountryName` AS `LabelerCountryName`,
`cem`.`EstablishmentName` AS `ManufacturerName`,
`cf`.`IsAContractManufacturer` AS `IsAContractManufacturer`,
`cem`.`RegistrationNumber` AS `ManufacturerRegistrationNumber`,
`addressm`.`StreetAddress` AS `ManufacturerStreetAddress`,
`addressm`.`City` AS `ManufacturerCity`,
(case when isnull(`statem`.`StateName`) then `addressm`.`OptionalState` else `statem`.`StateName` end) AS `ManufacturerStateName`,
`addressm`.`PostalCode` AS `ManufacturerPostalCode`,
`countrym`.`CountryName` AS `ManufacturerCountryName`,
`cep`.`EstablishmentName` AS `PackerName`,
`cep`.`RegistrationNumber` AS `PackerRegistrationNumber`,
`addressp`.`StreetAddress` AS `PackerStreetAddress`,
`addressp`.`City` AS `PackerCity`,
(case when isnull(`statep`.`StateName`) then `addressp`.`OptionalState` else `statep`.`StateName` end) AS `PackerStateName`,
`addressp`.`PostalCode` AS `PackerPostalCode`,
`countryp`.`CountryName` AS `PackerCountryName`,
`cf`.`IsCommerciallyDistributed` AS `IsCommerciallyDistributed`,
`category`.`CategoryCode` AS `CategoryCode`,
`category`.`CategoryDescription` AS `CategoryDescription`,
`cf`.`FilerType` AS `FilerType`,
`filer`.`FirstName` AS `AuthorizedIndividualFirstName`,
`filer`.`LastName` AS `AuthorizedIndividualLastName`,
`filer`.`Title` AS `AuthorizedIndividualTitle`,
`filer`.`Email` AS `AuthorizedIndividualEmail`,
`filer`.`Phone` AS `AuthorizedIndividualPhone`,
`altfiler`.`FirstName` AS `AlternativeAuthorizedIndividualFirstName`,
`altfiler`.`LastName` AS `AlternativeAuthorizedIndividualLastName`,
`altfiler`.`Title` AS `AlternativeAuthorizedIndividualTitle`,
`altfiler`.`Email` AS `AlternativeAuthorizedIndividualEmail`,
`altfiler`.`Phone` AS `AlternativeAuthorizedIndividualPhone`,
group_concat(distinct concat(`brand`.`BrandDescription`,':',`brand`.`ProductWebSite`) separator '|') AS `Brands`,
group_concat(distinct concat(`ic`.`DisplayCAS`,':',`ic`.`IngredientName`,':',`ic`.`Status`) separator '|') AS `Ingredients`,
`cf`.`RegisteredDate` AS `RegisteredDate`,
`cf`.`VerifiedDate` AS `VerifiedDate`,
`cf`.`DiscontinuedDate` AS `DiscontinuedDate`,
`cf`.`AmendedDate` AS `AmendedDate`,
`cf`.`ApprovedDate` AS `ApprovedDate`,
`cf`.`ApprovedBy` AS `ApprovedBy`,
`cf`.`ProcessedDate` AS `ProcessedDate`,
`cf`.`RejectedDate` AS `RejectedDate`,
`cf`.`IsPaperFiling` AS `IsPaperFiling`,
concat(`company`.`FirstName`,' ',`company`.`LastName`) AS `AccountName`,
`rq`.`IsFDACosmetic` AS `IsFDACosmetic`,
`rq`.`LabelElement` AS `LabelElement`,
`rq`.`LabelClaim` AS `LabelClaim`,
`rq`.`IngredientIssue` AS `IngredientIssue`,
`rq`.`Other` AS `Other` from ((((((((((((((((((((`CF01_CosmeticFormulation` `cf` 
left join `CF01_CosmeticEstablishment` `cem` on((`cf`.`ManufacturerId` = `cem`.`CosmeticEstablishmentId`))) 
left join `CF01_Address` `addressm` on(((`addressm`.`DocumentTypeId` = 1) and (`addressm`.`ObjectId` = `cf`.`ManufacturerId`) and (`addressm`.`IsActive` = 1)))) 
left join `CF01_State_R` `statem` on((`statem`.`StateId` = `addressm`.`StateId`))) 
left join `CF01_Country_R` `countrym` on((`countrym`.`CountryId` = `addressm`.`CountryId`))) 
left join `CF01_CosmeticEstablishment` `cep` on((`cf`.`PackerId` = `cep`.`CosmeticEstablishmentId`))) 
left join `CF01_Address` `addressp` on(((`addressp`.`DocumentTypeId` = 1) and (`addressp`.`ObjectId` = `cf`.`PackerId`) and (`addressp`.`IsActive` = 1)))) 
left join `CF01_State_R` `statep` on((`statep`.`StateId` = `addressp`.`StateId`))) 
left join `CF01_Country_R` `countryp` on((`countryp`.`CountryId` = `addressp`.`CountryId`))) 
left join `CF01_Labeler` `labeler` on(((`labeler`.`LabelerId` = `cf`.`LabelerId`) and (`labeler`.`IsActive` = 1)))) 
left join `CF01_Address` `addressl` on(((`addressl`.`DocumentTypeId` = 3) and (`addressl`.`ObjectId` = `cf`.`LabelerId`) and (`addressl`.`IsActive` = 1)))) 
left join `CF01_State_R` `statel` on((`statel`.`StateId` = `addressl`.`StateId`))) 
left join `CF01_Country_R` `countryl` on((`countryl`.`CountryId` = `addressl`.`CountryId`))) 
left join `CF01_Category_R` `category` on(((`category`.`CategoryId` = `cf`.`CategoryId`) and (`category`.`IsActive` = 1)))) 
left join `CF01_Brand` `brand` on(((`cf`.`CosmeticFormulationId` = `brand`.`CosmeticFormulationId`) and (`brand`.`IsActive` = 1)))) 
left join `CF01_Ingredient_CosmeticFormulation` `ic` on(((`ic`.`CosmeticFormulationId` = `cf`.`CosmeticFormulationId`) and (`ic`.`IsActive` = 1)))) 
left join `CF01_Status_R` `status` on(((`status`.`StatusId` = `cf`.`StatusId`) and (`status`.`IsActive` = 1)))) 
left join `CF01_Filer` `filer` on(((`cf`.`AuthorizedIndividualId` = `filer`.`FilerId`) and (`filer`.`IsActive` = 1)))) 
left join `CF01_Company` `company` on(((`company`.`CompanyId` = `cf`.`CompanyId`) and (`company`.`IsActive` = 1)))) 
left join `CF01_Filer` `altfiler` on(((`cf`.`AlternativeAuthorizedIndividualId` = `altfiler`.`FilerId`) and (`altfiler`.`IsActive` = 1)))) 
left join `CF01_ResearchQuestion` `rq` on(((`cf`.`CosmeticFormulationId` = `rq`.`CosmeticFormulationId`) and (`rq`.`IsActive` = 1)))) 
where (`cf`.`IsActive` = 1) and  `cf`.`CosmeticFormulationId` = _CosmeticFormulationId
group by `cf`.`CosmeticFormulationId`$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_Ingredient_Search_SP`(IN `_name` VARCHAR(100), IN `_cas` VARCHAR(50))
BEGIN 
   CASE
      WHEN (LENGTH(`_name`) < 4 OR `_name` IS NULL) AND (LENGTH(`_cas`) < 4 OR `_cas` IS NULL) THEN
         SELECT * FROM `CF01_Ingredient_Synonym_Union_VW`
         WHERE `IngredientName` like concat('%',IFNULL(`_name`,''),'%')
         and `CalcCAS` like concat('%',IFNULL(`_cas`,''), '%') order by length(`IngredientName`) limit 100;
      WHEN LENGTH(`_name`) > 3 AND (LENGTH(`_cas`) < 4 OR `_cas` IS NULL) THEN
         SELECT `i`.`IngredientId` AS `IngredientId`,
            `i`.`DisplayCAS` AS `DisplayCAS`,
            `i`.`OriginalCAS` AS `OriginalCAS`,
            `i`.`CalcCAS` AS `CalcCAS`,
            `i`.`TypeId` AS `TypeId`,
            `i`.`IngredientName` AS `IngredientName`,
            `i`.`IsHidden` AS `IsHidden`,
            `i`.`Status` AS `Status`,
            `i`.`CreatedOn` AS `CreatedOn`,
            `i`.`CreatedBy` AS `CreatedBy`,
            `i`.`ModifiedOn` AS `ModifiedOn`,
            `i`.`ModifiedBy` AS `ModifiedBy`,
            `i`.`IsActive` AS `IsActive`,
            0 AS `IsSynonym`
         FROM `CF01_Ingredient_R` `i`
         WHERE MATCH(`IngredientName`) AGAINST(concat(`_name`,'*') IN BOOLEAN MODE)
         and `CalcCAS` like concat('%',IFNULL(`_cas`,''), '%') 
         union
         SELECT `s`.`SynonymId` AS `IngredientId`,
            `s`.`DisplayCAS` AS `DisplayCAS`,
            `s`.`OriginalCAS` AS `OriginalCAS`,
            `s`.`CalcCAS` AS `CalcCAS`,
            `s`.`TypeId` AS `TypeId`,
            `s`.`IngredientName` AS `IngredientName`,
            `s`.`IsHidden` AS `IsHidden`,
            `s`.`Status` AS `Status`,
            `s`.`CreatedOn` AS `CreatedOn`,
            `s`.`CreatedBy` AS `CreatedBy`,
            `s`.`ModifiedOn` AS `ModifiedOn`,
            `s`.`ModifiedBy` AS `ModifiedBy`,
            `s`.`IsActive` AS `IsActive`,
            `s`.`IsSynonym` AS `IsSynonym`
         FROM `CF01_Ingredient_Synonym_R` `s`
         WHERE MATCH(`IngredientName`) AGAINST(concat(`_name`,'*') IN BOOLEAN MODE)
         and `CalcCAS` like concat('%',IFNULL(`_cas`,''), '%') limit 100;
      WHEN (LENGTH(`_name`) < 4 OR `_name` IS NULL) AND LENGTH(`_cas`) > 3 THEN
         SELECT `i`.`IngredientId` AS `IngredientId`,
            `i`.`DisplayCAS` AS `DisplayCAS`,
            `i`.`OriginalCAS` AS `OriginalCAS`,
            `i`.`CalcCAS` AS `CalcCAS`,
            `i`.`TypeId` AS `TypeId`,
            `i`.`IngredientName` AS `IngredientName`,
            `i`.`IsHidden` AS `IsHidden`,
            `i`.`Status` AS `Status`,
            `i`.`CreatedOn` AS `CreatedOn`,
            `i`.`CreatedBy` AS `CreatedBy`,
            `i`.`ModifiedOn` AS `ModifiedOn`,
            `i`.`ModifiedBy` AS `ModifiedBy`,
            `i`.`IsActive` AS `IsActive`,
            0 AS `IsSynonym`
         FROM `CF01_Ingredient_R` `i`
         WHERE MATCH(`CalcCAS`) AGAINST(concat(`_cas`,'*') IN BOOLEAN MODE)
         and `IngredientName` like concat('%',IFNULL(`_name`,''), '%') 
         union
         SELECT `s`.`SynonymId` AS `IngredientId`,
            `s`.`DisplayCAS` AS `DisplayCAS`,
            `s`.`OriginalCAS` AS `OriginalCAS`,
            `s`.`CalcCAS` AS `CalcCAS`,
            `s`.`TypeId` AS `TypeId`,
            `s`.`IngredientName` AS `IngredientName`,
            `s`.`IsHidden` AS `IsHidden`,
            `s`.`Status` AS `Status`,
            `s`.`CreatedOn` AS `CreatedOn`,
            `s`.`CreatedBy` AS `CreatedBy`,
            `s`.`ModifiedOn` AS `ModifiedOn`,
            `s`.`ModifiedBy` AS `ModifiedBy`,
            `s`.`IsActive` AS `IsActive`,
            `s`.`IsSynonym` AS `IsSynonym`
         FROM `CF01_Ingredient_Synonym_R` `s`
         WHERE MATCH(`CalcCAS`) AGAINST(concat(`_cas`,'*') IN BOOLEAN MODE)
         and `IngredientName` like concat('%',IFNULL(`_name`,''), '%') limit 100;
      ELSE
         SELECT `i`.`IngredientId` AS `IngredientId`,
            `i`.`DisplayCAS` AS `DisplayCAS`,
            `i`.`OriginalCAS` AS `OriginalCAS`,
            `i`.`CalcCAS` AS `CalcCAS`,
            `i`.`TypeId` AS `TypeId`,
            `i`.`IngredientName` AS `IngredientName`,
            `i`.`IsHidden` AS `IsHidden`,
            `i`.`Status` AS `Status`,
            `i`.`CreatedOn` AS `CreatedOn`,
            `i`.`CreatedBy` AS `CreatedBy`,
            `i`.`ModifiedOn` AS `ModifiedOn`,
            `i`.`ModifiedBy` AS `ModifiedBy`,
            `i`.`IsActive` AS `IsActive`,
            0 AS `IsSynonym`
         FROM `CF01_Ingredient_R` `i`
         WHERE MATCH(`IngredientName`) AGAINST(concat(`_name`,'*') IN BOOLEAN MODE)
         AND MATCH(`CalcCAS`) AGAINST(concat(`_cas`,'*') IN BOOLEAN MODE)
         union
         SELECT `s`.`SynonymId` AS `IngredientId`,
            `s`.`DisplayCAS` AS `DisplayCAS`,
            `s`.`OriginalCAS` AS `OriginalCAS`,
            `s`.`CalcCAS` AS `CalcCAS`,
            `s`.`TypeId` AS `TypeId`,
            `s`.`IngredientName` AS `IngredientName`,
            `s`.`IsHidden` AS `IsHidden`,
            `s`.`Status` AS `Status`,
            `s`.`CreatedOn` AS `CreatedOn`,
            `s`.`CreatedBy` AS `CreatedBy`,
            `s`.`ModifiedOn` AS `ModifiedOn`,
            `s`.`ModifiedBy` AS `ModifiedBy`,
            `s`.`IsActive` AS `IsActive`,
            `s`.`IsSynonym` AS `IsSynonym`
         FROM `CF01_Ingredient_Synonym_R` `s`
         WHERE MATCH(`IngredientName`) AGAINST(concat(`_name`,'*') IN BOOLEAN MODE)
         AND MATCH(`CalcCAS`) AGAINST(concat(`_cas`,'*') IN BOOLEAN MODE) order by length(`IngredientName`) limit 100;
   END CASE;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_Ingredient_Synonym_Search_SP`(IN `_name` VARCHAR(100), IN `_cas` VARCHAR(50), IN `_synonym` VARCHAR(100))
BEGIN 
SELECT * FROM `CF01_Ingredient_Synonym_Concat_VW` WHERE `IngredientName` like concat('%', _name, '%') and `CalcCAS` like concat( _cas, '%') and if(`_synonym`="",True, `Synonyms` like concat('%',`_synonym`, '%'))  order by length(`IngredientName`) limit 100;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_Ingredient_CosmeticFormulation_By_Id_SP`(IN `_ingredientid` INT)
    NO SQL
Select * From CF01_Ingredient_CosmeticFormulation WHERE IngredientId = _ingredientid$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_AUDIT_SUM_2511_By_Id_SP`(IN `_CosmeticEstablishmentId` INT)
    NO SQL
select `ce`.`CosmeticEstablishmentId` AS `CosmeticEstablishmentId`,
`ce`.`EstablishmentType` AS `EstablishmentType`,
(case when (`ce`.`EstablishmentType` like '%1%') then 'Manufacturer' else '' end) AS `Manufacturer`,
(case when (`ce`.`EstablishmentType` like '%2%') then 'Packer' else '' end) AS `Packer`,
(case when (`ce`.`EstablishmentType` like '%3%') then 'Distributor' else '' end) AS `Distributor`,
(case when (`ce`.`EstablishmentType` like '%4%') then 'Retailer' else '' end) AS `Retailer`,
(case when (`ce`.`EstablishmentType` like '%5%') then 'Business Office' else '' end) AS `BusinessOffice`,
`ce`.`RegistrationNumber` AS `RegistrationNumber`,
`ce`.`EstablishmentName` AS `EstablishmentName`,
`ce`.`ParentCompany` AS `ParentCompany`,
(case when (`ce`.`IsTheAddressManufacturingOrPacking` = 1) then 'Yes' when (`ce`.`IsTheAddressManufacturingOrPacking` = 0) then 'No' else '' end) AS `IsAddressManufacturingOrPacking`,
(case when (`ce`.`IsOwnerOperator` = 1) then 'Yes' when (`ce`.`IsOwnerOperator` = 0) then 'No' else '' end) AS `IsOwnerOperator`,
`address`.`StreetAddress` AS `StreetAddress`,
`address`.`City` AS `City`,
`address`.`PostalCode` AS `PostalCode`,
(case when isnull(`state`.`StateName`) then `address`.`OptionalState` else `state`.`StateName` end) AS `StateName`,
`country`.`CountryName` AS `CountryName`,
group_concat(distinct `trading`.`TradingName` separator ', ') AS `Tradings`,
`filer`.`FirstName` AS `AuthorizedIndividualFirstName`,
`filer`.`LastName` AS `AuthorizedIndividualLastName`,
`filer`.`Title` AS `AuthorizedIndividualTitle`,
`filer`.`Email` AS `AuthorizedIndividualEmail`,
`filer`.`Phone` AS `AuthorizedIndividualPhone`,
`altfiler`.`FirstName` AS `AlternativeAuthorizedIndividualFirstName`,
`altfiler`.`LastName` AS `AlternativeAuthorizedIndividualLastName`,
`altfiler`.`Title` AS `AlternativeAuthorizedIndividualTitle`,
`altfiler`.`Email` AS `AlternativeAuthorizedIndividualEmail`,
`altfiler`.`Phone` AS `AlternativeAuthorizedIndividualPhone`,
`ce`.`StatusId` AS `StatusId`,
`status`.`StatusDescription` AS `StatusDescription`,
cast(`ce`.`RegisteredDate` as date) AS `RegisteredDate`,
cast(`ce`.`VerifiedDate` as date) AS `VerifiedDate`,
cast(`ce`.`DiscontinuedDate` as date) AS `DiscontinuedDate`,
cast(`ce`.`AmendedDate` as date) AS `AmendedDate`,
cast(`ce`.`ApprovedDate` as date) AS `ApprovedDate`,
`ce`.`ApprovedBy` AS `ApprovedBy`,
cast(`ce`.`RejectedDate` as date) AS `RejectedDate`,
cast(`ce`.`ProcessedDate` as date) AS `ProcessedDate`,
`ce`.`IsPaperFiling` AS `IsPaperFiling`,
concat(`company`.`FirstName`,' ',`company`.`LastName`) AS `CompanyName` from (((((((((SELECT * FROM `Appian`.`CF01_CosmeticEstablishment` c WHERE c.CosmeticEstablishmentId = _CosmeticEstablishmentId) AS `ce` 
left join `Appian`.`CF01_Trading` `trading` on((`ce`.`CosmeticEstablishmentId` = `trading`.`CosmeticEstablishmentId`))) 
left join `Appian`.`CF01_Address` `address` on(((`address`.`DocumentTypeId` = 1) and (`address`.`ObjectId` = `ce`.`CosmeticEstablishmentId`) and (`address`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Status_R` `status` on(((`ce`.`StatusId` = `status`.`StatusId`) and (`status`.`IsActive` = 1)))) 
left join `Appian`.`CF01_State_R` `state` on((`state`.`StateId` = `address`.`StateId`))) 
left join `Appian`.`CF01_Country_R` `country` on((`country`.`CountryId` = `address`.`CountryId`))) 
left join `Appian`.`CF01_Filer` `filer` on(((`ce`.`AuthorizedIndividualId` = `filer`.`FilerId`) and (`filer`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Company` `company` on(((`ce`.`CompanyId` = `company`.`CompanyId`) and (`company`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Filer` `altfiler` on(((`ce`.`AlternativeAuthorizedIndividualId` = `altfiler`.`FilerId`) and (`altfiler`.`IsActive` = 1)))) group by `ce`.`CosmeticEstablishmentId`$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_MONTHLY_COUNT_2512_SP`(IN `_dt1` DATETIME, IN `_dt2` DATETIME, IN `_dt3` DATETIME)
BEGIN
SELECT
    "ACTIVE" AS status,
    SUM(CASE WHEN `RegisteredDate` > DATE_SUB(CURDATE(), INTERVAL 1 MONTH) THEN 1 ELSE 0 END) AS lastMonth,
    SUM(CASE WHEN `RegisteredDate` > _dt1 THEN 1 ELSE 0 END) AS date1,
    SUM(CASE WHEN `RegisteredDate` > _dt2 THEN 1 ELSE 0 END) AS date2,
    SUM(CASE WHEN `RegisteredDate` > _dt3 THEN 1 ELSE 0 END) AS date3
FROM
    `CF01_CosmeticFormulation`
WHERE
    `IsActive` = TRUE AND `CosmeticFormulationId` IS NOT NULL AND `StatusId` IN(109, 110, 2)
UNION
SELECT
    "DISCONTINUED" AS status,
    SUM(CASE WHEN `RegisteredDate` > DATE_SUB(CURDATE(), INTERVAL 1 MONTH) THEN 1 ELSE 0 END) AS lastMonth,
    SUM(CASE WHEN `RegisteredDate` > _dt1 THEN 1 ELSE 0 END) AS date1,
    SUM(CASE WHEN `RegisteredDate` > _dt2 THEN 1 ELSE 0 END) AS date2,
    SUM(CASE WHEN `RegisteredDate` > _dt3 THEN 1 ELSE 0 END) AS date3
FROM
    `CF01_CosmeticFormulation`
WHERE
    `IsActive` = TRUE AND `CosmeticFormulationId` IS NOT NULL AND `StatusId` IN(3,107)
UNION
SELECT
    "REJECTED" AS status,
    SUM(CASE WHEN `RegisteredDate` > DATE_SUB(CURDATE(), INTERVAL 1 MONTH) THEN 1 ELSE 0 END) AS lastMonth,
    SUM(CASE WHEN `RegisteredDate` > _dt1 THEN 1 ELSE 0 END) AS date1,
    SUM(CASE WHEN `RegisteredDate` > _dt2 THEN 1 ELSE 0 END) AS date2,
    SUM(CASE WHEN `RegisteredDate` > _dt3 THEN 1 ELSE 0 END) AS date3
FROM
    `CF01_CosmeticFormulation`
WHERE
    `IsActive` = TRUE AND `CosmeticFormulationId` IS NOT NULL AND `StatusId` IN(5,104,105);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_CustomSQL_SP`(IN `query_v` VARCHAR(10000))
    NO SQL
BEGIN
SET @query_v = CONCAT(query_v);
    PREPARE stmt FROM @query_v;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_Ingredient_Search_With_Limit_SP`(IN `_name` VARCHAR(100), IN `_cas` VARCHAR(100), IN `_limit` INT, IN `_hidden` INT)
    NO SQL
BEGIN 
SELECT * FROM `CF01_Ingredient_Synonym_Union_VW` WHERE `IngredientName` like concat('%', _name, '%') and `CalcCAS` like concat( _cas, '%') and `IsHidden`=_hidden order by length(`IngredientName`) limit _limit;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_MAIN_Get_Formulations_By_CompanyId_SP`(IN `_id` INT)
    NO SQL
SELECT
        CosmeticFormulation.CosmeticFormulationId AS CosmeticFormulationId,
        CosmeticFormulation.RegistrationNumber AS CPIS,
        CosmeticFormulation.CompanyId AS CompanyId,
        Brand.BrandDescription AS Brands,
        Labeler.LabelerName AS LabelerName,
        Category.CategoryDescription AS ProductCategory,
        Company.CompanyName AS Filer,
        CosmeticFormulation.RegisteredDate AS SubmittedDate,
        CosmeticFormulation.AmendedDate AS AmendedDate,
        CosmeticFormulation.VerifiedDate AS VerifiedDate,
        Status_R.StatusDescription AS Status,
        CosmeticFormulation.IsOnHold AS IsOnHold,
        CosmeticFormulation.IsPaperFiling AS PaperFiling
    FROM (SELECT 
                cf.CosmeticFormulationId,
                cf.RegistrationNumber,
                cf.CompanyId,
                cf.RegisteredDate,
                cf.AmendedDate,
                cf.VerifiedDate,
                cf.IsOnHold,
                cf.IsPaperFiling,
                cf.LabelerId,
                cf.CategoryId,
                cf.StatusId
            FROM CF01_CosmeticFormulation cf
            WHERE cf.IsActive = 1
                AND CASE 
                    WHEN _id = (-1) THEN cf.StatusId IN (1,2,106)
                    ELSE cf.CompanyId = _id
                END
            ORDER BY cf.RegisteredDate DESC) AS CosmeticFormulation
        LEFT JOIN (SELECT
                    b.CosmeticFormulationId,
                    b.BrandDescription
                FROM CF01_Brand b
                WHERE b.IsActive = 1
                    AND b.brandDescription IS NOT NULL
                GROUP BY b.CosmeticFormulationId) AS Brand
        ON CosmeticFormulation.CosmeticFormulationId = Brand.CosmeticFormulationId
        LEFT JOIN (SELECT
                    l.LabelerId,
                    l.LabelerName
                FROM CF01_Labeler l) AS Labeler
        ON CosmeticFormulation.LabelerId = Labeler.LabelerId
        LEFT JOIN (SELECT
                    cat.CategoryId,
                    cat.CategoryDescription
                FROM CF01_Category_R cat) AS Category
        ON CosmeticFormulation.CategoryId = Category.CategoryId
        LEFT JOIN (SELECT
                    com.CompanyId,
                    com.CompanyName
                FROM CF01_Company com
                GROUP BY com.CompanyId) AS Company
        ON CosmeticFormulation.CompanyId = Company.CompanyId
        LEFT JOIN (SELECT
                    s.StatusId,
                    s.StatusDescription
                FROM CF01_Status_R s) AS Status_R
        ON CosmeticFormulation.StatusId = Status_R.StatusId
    LIMIT 1000$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_MAIN_Get_Establishments_By_CompanyId_SP`(IN `_id` INT)
    NO SQL
SELECT
        CosmeticEstablishment.CosmeticEstablishmentId AS CosmeticEstablishmentId,
        CosmeticEstablishment.RegistrationNumber AS RegistrationNumber,
        CosmeticEstablishment.EstablishmentName AS EstablishmentName,
        CosmeticEstablishment.ParentCompany AS ParentCompany,
        Company.CompanyName AS Filer,
        CosmeticEstablishment.RegisteredDate AS SubmittedDate,
        CosmeticEstablishment.AmendedDate AS AmendedDate,
        CosmeticEstablishment.VerifiedDate AS VerifiedDate,
        Status_R.StatusDescription AS Status,
        CosmeticEstablishment.IsOnHold AS IsOnHold,
        CosmeticEstablishment.IsPaperFiling AS PaperFiling
    FROM (SELECT 
                ce.CosmeticEstablishmentId,
                ce.RegistrationNumber,
                ce.EstablishmentName,
                ce.ParentCompany,
                ce.CompanyId,
                ce.RegisteredDate,
                ce.AmendedDate,
                ce.VerifiedDate,
                ce.StatusId,
                ce.IsOnHold,
                ce.IsPaperFiling
            FROM CF01_CosmeticEstablishment ce
            WHERE ce.IsActive = 1
                AND CASE 
                    WHEN _id = (-1) THEN ce.StatusId IN (1,2,106)
                    ELSE ce.CompanyId = _id
                END
            ORDER BY ce.RegisteredDate DESC)
        AS CosmeticEstablishment
        LEFT JOIN (SELECT
                    com.CompanyId,
                    com.CompanyName
                FROM CF01_Company com
                GROUP BY com.CompanyId) AS Company
        ON CosmeticEstablishment.CompanyId = Company.CompanyId
        LEFT JOIN (SELECT
                    s.StatusId,
                    s.StatusDescription
                FROM CF01_Status_R s) AS Status_R
        ON CosmeticEstablishment.StatusId = Status_R.StatusId
    LIMIT 1000$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_Company_UserName_fix_SP`()
BEGIN
-- Variable declaration
   DECLARE output_v VARCHAR(255) DEFAULT '';
   DECLARE c CHAR(1) DEFAULT '';
   DECLARE i INT DEFAULT 1;
   DECLARE more_data INT DEFAULT TRUE;
   DECLARE no_data CONDITION FOR SQLSTATE '02000';
   DECLARE CompanyId_v INT(11);
   DECLARE UserName_v VARCHAR(255);
   DECLARE curs CURSOR FOR SELECT CompanyId, UserName FROM CF01_Company WHERE UserName IS NOT NULL;
   DECLARE CONTINUE HANDLER FOR no_data
      BEGIN
	     SET more_data = FALSE;
      END;
   OPEN curs;
   WHILE more_data DO
      FETCH curs INTO CompanyId_v, UserName_v;
      IF LENGTH(UserName_v) > 0 AND UserName_v IS NOT NULL THEN
	     SET output_v = '';
		 SET i = 1;
-- Iterate through username string
          WHILE i <= LENGTH(UserName_v) DO
             SET c = MID(UserName_v, i, 1);
             IF (ASCII(c) >= 48 AND ASCII(c) <= 57)
             OR (ASCII(c) >= 65 AND ASCII(c) <= 90)
             OR (ASCII(c) >= 97 AND ASCII(c) <= 122)
             OR (ASCII(c) IN (45,46,64,95))
             THEN
                SET output_v = CONCAT(output_v, c);
             END IF;
-- Increment iterator
             SET i = i + 1;
          END WHILE;
         IF LENGTH(UserName_v) <> LENGTH(output_v) AND output_v IS NOT NULL THEN
--		 SELECT UserName_v FROM DUAL;
--		 SELECT output_v FROM DUAL;
		    UPDATE CF01_Company
			SET UserName = output_v
			WHERE CompanyId = CompanyId_v;
		 END IF;
	  END IF;
   END WHILE;
   CLOSE curs;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_MAIN_Get_New_Account_SP`()
    NO SQL
SELECT 
CompanyId AS CompanyId,
    CompanyName AS CompanyName,
    FirstName AS CompanyFirstName,
    LastName AS CompanyLastName,
    UserName AS Username,
    Phone,
    CreatedOn AS DateCreated,
    Status
FROM
    CF01_Company
WHERE
    Status = 0
    AND CreatedOn IS NOT NULL$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_MAIN_Get_New_Labeler_SP`()
BEGIN
SELECT
	Labeler.LabelerId AS LabelerId,
	Labeler.LabelerName AS LabelerName,
	Address.StreetAddress AS Street,
	Address.City AS City,
	Address.State AS State,
	Address.Zip AS Zip,
	Address.Country AS Country,
	Labeler.CreatedOn AS FiledDate,
	Status_R.StatusDescription AS LabelerStatus
    
FROM
	(SELECT
		l.LabelerId,
		l.CompanyId,
		l.LabelerName,
		l.CreatedOn,
		l.StatusId
	FROM
		CF01_Labeler l
	WHERE
		l.IsActive = true
		AND l.StatusId NOT IN (100,102,104,105,107,109,110,3,4,5,101)
	) AS Labeler
    
    LEFT JOIN
    (SELECT
		a.ObjectId,
		a.StreetAddress,
		a.City,
		a.State,
		a.Zip,
		a.Country
	FROM
		CF01_Address_Concat_VW a
	WHERE
		a.DocumentTypeId = 3
	) AS Address
    ON Labeler.LabelerId = Address.ObjectId
    
    LEFT JOIN
    (SELECT
		s.StatusId,
		s.StatusDescription
	FROM
		CF01_Status_R s
	) AS Status_R
    ON Labeler.StatusId = Status_R.StatusId;
	
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_MONTHLY_COUNT_Brand_SP`(
	IN _dt1 DATETIME,
	IN _dt2 DATETIME,
    IN _dt3 DATETIME
)
BEGIN
SELECT
	'ACTIVE' AS 'status',
	SUM(CASE WHEN RegisteredDate > DATE_SUB(CURDATE(), INTERVAL 1 MONTH) THEN 1 ELSE 0 END) AS lastMonth,
	SUM(CASE WHEN RegisteredDate > _dt1 THEN 1 ELSE 0 END) AS date1,
	SUM(CASE WHEN RegisteredDate > _dt2 THEN 1 ELSE 0 END) AS date2,
	SUM(CASE WHEN RegisteredDate > _dt3 THEN 1 ELSE 0 END) AS date3
FROM
	CF01_REPORT_Brand_VW
WHERE
	BrandId IS NOT NULL
	AND CosmeticFormulationId IS NOT NULL
	AND StatusId IN(109, 110)
	
UNION
SELECT
	'DISCONTINUED' AS 'status',
	SUM(CASE WHEN RegisteredDate > DATE_SUB(CURDATE(), INTERVAL 1 MONTH) THEN 1 ELSE 0 END) AS lastMonth,
    SUM(CASE WHEN RegisteredDate > _dt1 THEN 1 ELSE 0 END) AS date1,
	SUM(CASE WHEN RegisteredDate > _dt2 THEN 1 ELSE 0 END) AS date2,
	SUM(CASE WHEN RegisteredDate > _dt3 THEN 1 ELSE 0 END) AS date3
FROM
    CF01_REPORT_Brand_VW
WHERE
	BrandId IS NOT NULL
	AND CosmeticFormulationId IS NOT NULL
	AND StatusId IN(3, 107)
	
UNION
SELECT
	'REJECTED' AS 'status',
	SUM(CASE WHEN RegisteredDate > DATE_SUB(CURDATE(), INTERVAL 1 MONTH) THEN 1 ELSE 0 END) AS lastMonth,
	SUM(CASE WHEN RegisteredDate > _dt1 THEN 1 ELSE 0 END) AS date1,
	SUM(CASE WHEN RegisteredDate > _dt2 THEN 1 ELSE 0 END) AS date2,
	SUM(CASE WHEN RegisteredDate > _dt3 THEN 1 ELSE 0 END) AS date3
FROM
	CF01_REPORT_Brand_VW
WHERE
	BrandId IS NOT NULL
	AND CosmeticFormulationId IS NOT NULL
	AND StatusId IN(5, 104, 105);
	
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_MONTHLY_COUNT_2511_SP`(IN `_dt1` DATETIME, IN `_dt2` DATETIME, IN `_dt3` DATETIME)
    NO SQL
SELECT
    SUM(CASE WHEN `RegisteredDate` > DATE_SUB(CURDATE(), INTERVAL 1 MONTH) THEN 1 ELSE 0 END) AS lastMonth,
    SUM(CASE WHEN `RegisteredDate` > _dt1 THEN 1 ELSE 0 END) AS date1,
    SUM(CASE WHEN `RegisteredDate` > _dt2 THEN 1 ELSE 0 END) AS date2,
    SUM(CASE WHEN `RegisteredDate` > _dt3 THEN 1 ELSE 0 END) AS date3
FROM `CF01_CosmeticEstablishment`
WHERE `IsActive` = TRUE AND `CosmeticEstablishmentId` IS NOT NULL AND `StatusId` IN(109, 110, 2)
UNION
SELECT
    SUM(CASE WHEN `RegisteredDate` > DATE_SUB(CURDATE(), INTERVAL 1 MONTH) THEN 1 ELSE 0 END) AS lastMonth,
    SUM(CASE WHEN `RegisteredDate` > _dt1 THEN 1 ELSE 0 END) AS date1,
    SUM(CASE WHEN `RegisteredDate` > _dt2 THEN 1 ELSE 0 END) AS date2,
    SUM(CASE WHEN `RegisteredDate` > _dt3 THEN 1 ELSE 0 END) AS date3
FROM `CF01_CosmeticEstablishment`
WHERE `IsActive` = TRUE AND `CosmeticEstablishmentId` IS NOT NULL AND `StatusId` IN(3,107)
UNION
SELECT
    SUM(CASE WHEN `RegisteredDate` > DATE_SUB(CURDATE(), INTERVAL 1 MONTH) THEN 1 ELSE 0 END) AS lastMonth,
    SUM(CASE WHEN `RegisteredDate` > _dt1 THEN 1 ELSE 0 END) AS date1,
    SUM(CASE WHEN `RegisteredDate` > _dt2 THEN 1 ELSE 0 END) AS date2,
    SUM(CASE WHEN `RegisteredDate` > _dt3 THEN 1 ELSE 0 END) AS date3
FROM `CF01_CosmeticEstablishment`
WHERE `IsActive` = TRUE AND `CosmeticEstablishmentId` IS NOT NULL AND `StatusId` IN(4,5,102,104,105)$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_RENEWAL_2512_SP`(IN `_companyid` INT, IN `_month` INT, IN `_day` INT)
    NO SQL
CASE WHEN _companyid=0 THEN
(select `c`.`CosmeticFormulationId` AS `CosmeticFormulationId`,
`c`.`RegistrationNumber` AS `RegistrationNumber`,
`b`.`LabelerName` AS `LabelerName`,
`d`.`StreetAddress` AS `StreetAddress`,
`d`.`City` AS `City`,
`e`.`StateName` AS `StateName`,
`d`.`PostalCode` AS `PostalCode`,
`f`.`CountryName` AS `CountryName`,
`g`.`CategoryCode` AS `CategoryCode`,
`g`.`CategoryDescription` AS `CategoryDescription`,
`i`.`StatusDescription` AS `StatusDescription`,
`c`.`CreatedOn` AS `CreatedOn`,
`c`.`VerifiedDate` AS `VerifiedDate`,
`c`.`StatusId` AS `StatusId`,
`c`.`CompanyId` AS `CompanyId`,
`c`.`IsActive` AS `IsActive`,
group_concat(`a`.`BrandDescription` separator ', ') AS `Brands` 
from ((((((((`Appian`.`CF01_CosmeticFormulation` `c` 
left join `Appian`.`CF01_Brand` `a` on(((`c`.`CosmeticFormulationId` = `a`.`CosmeticFormulationId`) and (`a`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Labeler` `b` on(((`b`.`LabelerId` = `c`.`LabelerId`) and (`b`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Address` `d` on(((`d`.`DocumentTypeId` = 3) and (`d`.`ObjectId` = `b`.`LabelerId`) and (`d`.`IsActive` = 1)))) 
left join `Appian`.`CF01_State_R` `e` on((`e`.`StateId` = `d`.`StateId`))) 
left join `Appian`.`CF01_Country_R` `f` on((`f`.`CountryId` = `d`.`CountryId`))) 
left join `Appian`.`CF01_Category_R` `g` on(((`g`.`CategoryId` = `c`.`CategoryId`) and (`g`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Status_R` `i` on(((`i`.`StatusId` = `c`.`StatusId`) and (`i`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Company` `company` on(((`c`.`CompanyId` = `company`.`CompanyId`) and (`company`.`IsActive` = 1)))) 
where ((`c`.`IsActive` = 1) 
and (`c`.`VerifiedDate` BETWEEN DATE_SUB(DATE_SUB(now(), INTERVAL _month MONTH),INTERVAL _day +1 DAY) AND DATE_SUB(DATE_SUB(now(), INTERVAL _month MONTH),INTERVAL _day DAY))) group by `c`.`CosmeticFormulationId`);
ELSE
(select `c`.`CosmeticFormulationId` AS `CosmeticFormulationId`,
`c`.`RegistrationNumber` AS `RegistrationNumber`,
`b`.`LabelerName` AS `LabelerName`,
`d`.`StreetAddress` AS `StreetAddress`,
`d`.`City` AS `City`,
`e`.`StateName` AS `StateName`,
`d`.`PostalCode` AS `PostalCode`,
`f`.`CountryName` AS `CountryName`,
`g`.`CategoryCode` AS `CategoryCode`,
`g`.`CategoryDescription` AS `CategoryDescription`,
`i`.`StatusDescription` AS `StatusDescription`,
`c`.`CreatedOn` AS `CreatedOn`,
`c`.`VerifiedDate` AS `VerifiedDate`,
`c`.`StatusId` AS `StatusId`,
`c`.`CompanyId` AS `CompanyId`,
`c`.`IsActive` AS `IsActive`,
group_concat(`a`.`BrandDescription` separator ', ') AS `Brands` 
from ((((((((`Appian`.`CF01_CosmeticFormulation` `c` 
left join `Appian`.`CF01_Brand` `a` on(((`c`.`CosmeticFormulationId` = `a`.`CosmeticFormulationId`) and (`a`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Labeler` `b` on(((`b`.`LabelerId` = `c`.`LabelerId`) and (`b`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Address` `d` on(((`d`.`DocumentTypeId` = 3) and (`d`.`ObjectId` = `b`.`LabelerId`) and (`d`.`IsActive` = 1)))) 
left join `Appian`.`CF01_State_R` `e` on((`e`.`StateId` = `d`.`StateId`))) 
left join `Appian`.`CF01_Country_R` `f` on((`f`.`CountryId` = `d`.`CountryId`))) 
left join `Appian`.`CF01_Category_R` `g` on(((`g`.`CategoryId` = `c`.`CategoryId`) and (`g`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Status_R` `i` on(((`i`.`StatusId` = `c`.`StatusId`) and (`i`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Company` `company` on(((`c`.`CompanyId` = `company`.`CompanyId`) and (`company`.`IsActive` = 1)))) 
where ((`c`.`IsActive` = 1) 
and `c`.`CompanyId` = _companyid
and `c`.`StatusId` =109
and (`c`.`VerifiedDate` BETWEEN DATE_SUB(DATE_SUB(now(), INTERVAL _month MONTH),INTERVAL _day +1 DAY) AND DATE_SUB(DATE_SUB(now(), INTERVAL _month MONTH),INTERVAL _day DAY))) group by `c`.`CosmeticFormulationId`);
END CASE$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_MONTHLY_COUNT_Labeler_SP`(IN `_dt1` DATETIME, IN `_dt2` DATETIME, IN `_dt3` DATETIME)
BEGIN
SELECT
    SUM(CASE WHEN lcf.SinceDate > DATE_SUB(curdate(), INTERVAL 1 MONTH) THEN 1 ELSE 0 END) AS lastMonth,
    SUM(CASE WHEN lcf.SinceDate > _dt1 THEN 1 ELSE 0 END) AS date1,
    SUM(CASE WHEN lcf.SinceDate > _dt2 THEN 1 ELSE 0 END) AS date2,
    SUM(CASE WHEN lcf.SinceDate > _dt3 THEN 1 ELSE 0 END) AS date3
FROM
    (SELECT
        lcfTemp.LabelerId,
        lcfTemp.SinceDate
    FROM
        (SELECT
            LabelerId,
            MIN(RegisteredDate) AS SinceDate
        FROM
            CF01_CosmeticFormulation
        WHERE
            StatusId = 109 AND RegisteredDate IS NOT NULL
        GROUP BY
            LabelerId) AS lcfTemp
        
        LEFT JOIN
        (SELECT
            LabelerId
        FROM
            CF01_Labeler
        WHERE
            StatusId = 101) AS Labeler
        ON Labeler.LabelerId = lcfTemp.LabelerId
    WHERE
        Labeler.LabelerId IS NOT NULL) AS lcf;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_REPORT_2511_WEBMOD_SP`(IN `_status` VARCHAR(100), IN `_company` VARCHAR(100), IN `_registrationnumber` VARCHAR(100), IN `_establishmentname` VARCHAR(100), IN `_companyid` INT)
    NO SQL
CASE WHEN _companyid = 0 THEN
(select `a`.`CompanyId` AS `companyid`,
`company`.`CompanyName` AS `companyname`,
`a`.`CosmeticEstablishmentId` AS `cosmeticestablishmentid`,
`a`.`EstablishmentType` AS `establishmenttype`,
(case when (`a`.`EstablishmentType` like '%1%') then 'Manufacturer' else '' end) AS `manufacturer`,
(case when (`a`.`EstablishmentType` like '%2%') then 'Packer' else '' end) AS `packer`,
`a`.`RegistrationNumber` AS `registrationnumber`,
`a`.`EstablishmentName` AS `establishmentname`,
cast(`a`.`RegisteredDate` as date) AS `registereddate`,
cast(`a`.`AmendedDate` as date) AS `amendeddate`,
`b`.`StateId` AS `stateid`,
`b`.`CountryId` AS `countryid`,
`b`.`StreetAddress` AS `streetaddress`,
`b`.`City` AS `city`,
`b`.`PostalCode` AS `postalcode`,
(case when isnull(`e`.`StateName`) then `b`.`OptionalState` else `e`.`StateName` end) AS `statename`,
`f`.`CountryName` AS `countryname`,
`b`.`OptionalState` AS `optionalstate`,
`b`.`IsActive` AS `isactive`,
`c`.`StatusDescription` AS `statusdescription` from (((((`Appian`.`CF01_CosmeticEstablishment` `a` 
left join `Appian`.`CF01_Company` `company` on(((`a`.`CompanyId` = `company`.`CompanyId`) and (`company`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Address` `b` on(((`b`.`DocumentTypeId` = 1) and (`b`.`ObjectId` = `a`.`CosmeticEstablishmentId`) and (`b`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Status_R` `c` on(((`a`.`StatusId` = `c`.`StatusId`) and (`c`.`IsActive` = 1)))) 
left join `Appian`.`CF01_State_R` `e` on((`e`.`StateId` = `b`.`StateId`))) 
left join `Appian`.`CF01_Country_R` `f` on((`f`.`CountryId` = `b`.`CountryId`))) 
where ((`a`.`IsActive` = 1) and (`a`.`StatusId` IN (110,2))
and IFNULL(`c`.`StatusDescription`,'') LIKE CONCAT('%',_status,'%')
and IFNULL(`company`.`CompanyName`,'') LIKE CONCAT('%',_company,'%')
and IFNULL(`a`.`RegistrationNumber`,'') LIKE CONCAT('%',_registrationnumber,'%')
and IFNULL(`a`.`EstablishmentName`,'') LIKE CONCAT('%',_establishmentname,'%')))LIMIT 500;
ELSE
(select `a`.`CompanyId` AS `companyid`,
`company`.`CompanyName` AS `companyname`,
`a`.`CosmeticEstablishmentId` AS `cosmeticestablishmentid`,
`a`.`EstablishmentType` AS `establishmenttype`,
(case when (`a`.`EstablishmentType` like '%1%') then 'Manufacturer' else '' end) AS `manufacturer`,
(case when (`a`.`EstablishmentType` like '%2%') then 'Packer' else '' end) AS `packer`,
`a`.`RegistrationNumber` AS `registrationnumber`,
`a`.`EstablishmentName` AS `establishmentname`,
cast(`a`.`RegisteredDate` as date) AS `registereddate`,
cast(`a`.`AmendedDate` as date) AS `amendeddate`,
`b`.`StateId` AS `stateid`,
`b`.`CountryId` AS `countryid`,
`b`.`StreetAddress` AS `streetaddress`,
`b`.`City` AS `city`,
`b`.`PostalCode` AS `postalcode`,
(case when isnull(`e`.`StateName`) then `b`.`OptionalState` else `e`.`StateName` end) AS `statename`,
`f`.`CountryName` AS `countryname`,
`b`.`OptionalState` AS `optionalstate`,
`b`.`IsActive` AS `isactive`,
`c`.`StatusDescription` AS `statusdescription` from (((((`Appian`.`CF01_CosmeticEstablishment` `a` 
left join `Appian`.`CF01_Company` `company` on(((`a`.`CompanyId` = `company`.`CompanyId`) and (`company`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Address` `b` on(((`b`.`DocumentTypeId` = 1) and (`b`.`ObjectId` = `a`.`CosmeticEstablishmentId`) and (`b`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Status_R` `c` on(((`a`.`StatusId` = `c`.`StatusId`) and (`c`.`IsActive` = 1)))) 
left join `Appian`.`CF01_State_R` `e` on((`e`.`StateId` = `b`.`StateId`))) 
left join `Appian`.`CF01_Country_R` `f` on((`f`.`CountryId` = `b`.`CountryId`))) 
where ((`a`.`IsActive` = 1) and (`a`.`StatusId` IN (110,2)) and `a`.`CompanyId`= _companyid
and IFNULL(`c`.`StatusDescription`,'') LIKE CONCAT(_status,'%')
and IFNULL(`company`.`CompanyName`,'') LIKE CONCAT(_company,'%')
and IFNULL(`a`.`RegistrationNumber`,'') LIKE CONCAT(_registrationnumber,'%')
and IFNULL(`a`.`EstablishmentName`,'') LIKE CONCAT(_establishmentname,'%')))LIMIT 500;
END CASE$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_MOUNTLY_COUNT_Account_SP`(IN `_dt1` DATETIME, IN `_dt2` DATETIME, IN `_dt3` DATETIME)
BEGIN
SELECT
    SUM(CASE
        WHEN IFNULL(`ModifiedOn`,`CreatedOn`) > DATE_SUB(now(), INTERVAL 1 MONTH) THEN 1
        ELSE 0
        END) AS lastMonth,
    SUM(CASE
        WHEN IFNULL(`ModifiedOn`,`CreatedOn`) > _dt1 THEN 1
        ELSE 0
        END) AS date1,
    SUM(CASE
        WHEN IFNULL(`ModifiedOn`,`CreatedOn`) > _dt2 THEN 1
        ELSE 0
        END) AS date2,
    SUM(CASE
        WHEN IFNULL(`ModifiedOn`,`CreatedOn`) > _dt3 THEN 1
        ELSE 0
        END) AS date3
FROM
    `CF01_Company`
WHERE
    `IsActive` = TRUE AND `Status` IN(1, 3);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_REPORT_2512_Research_Question_SP`(IN `brand_v` VARCHAR(100), IN `cpis_v` VARCHAR(100), IN `status_v` VARCHAR(100), IN `company_name_v` VARCHAR(100), IN `start_index_v` INT)
BEGIN 
   DECLARE query_v TEXT(10000) DEFAULT CONCAT('SELECT   
        CosmeticFormulation.RegistrationNumber AS CPIS,
        Brand.Brands AS Brands,
        Status.StatusDescription AS Status,
        Company.CompanyName AS CompanyName,
        ResearchQuestion.IsFDACosmetic AS Cosmetic,
        ResearchQuestion.PlaceBusinessIssue AS PlaceBusinessIssue,
        ResearchQuestion.NetQuantityIssue AS NetQuantityIssue,
        ResearchQuestion.WarningStatementIssue AS WarningStatementIssue,
        ResearchQuestion.NoDrugFactsLabelingClaim AS NoDrugFactsLabelingClaim,
        ResearchQuestion.WithDrugFactsLabelingClaim AS WithDrugFactsLabelingClaim,
        ResearchQuestion.MedicalDeviceClaim AS MedicalDeviceClaim,
        ResearchQuestion.FDAApprovedRegisteredClaim AS FDAApprovedRegisteredClaim,
        ResearchQuestion.ColorAdditiveIssue AS ColorAdditiveIssue,
        ResearchQuestion.ProstaglandinAnalogue AS ProstaglandinAnalogue,
        ResearchQuestion.ProfessionalUseOnly AS ProfessionalUseOnly,
        CosmeticFormulation.CosmeticFormulationId AS CosmeticFormulationId
    FROM
        (SELECT 
            cf.CosmeticFormulationId AS CosmeticFormulationId,
            cf.RegistrationNumber AS RegistrationNumber,
            cf.StatusId AS StatusId,
            cf.CompanyId AS CompanyId,
            cf.CategoryId AS CategoryId,
            cf.IsCommerciallyDistributed AS IsCommerciallyDistributed
        FROM CF01_CosmeticFormulation cf 
        WHERE cf.IsActive=1 
        AND cf.StatusId IN (1,2,3,4,5,103,104,105,106,107,108,109,110)) AS CosmeticFormulation
        LEFT JOIN
        (SELECT 
            b.BrandDocumentId AS BrandDocumentId,
            b.CosmeticFormulationId AS CosmeticFormulationId,
            GROUP_CONCAT(b.BrandDescription) AS Brands,
            GROUP_CONCAT(b.ProductWebsite) AS Websites
        FROM CF01_Brand b
        WHERE b.IsActive=1 GROUP BY b.CosmeticFormulationId)
        AS Brand
        ON CosmeticFormulation.CosmeticFormulationId = Brand.CosmeticFormulationId
        LEFT JOIN
        (SELECT 
            s.StatusId AS StatusId,
            s.StatusDescription AS StatusDescription
        FROM CF01_Status_R s
        WHERE s.IsActive=1)
        AS Status
        ON CosmeticFormulation.StatusId = Status.StatusId
        LEFT JOIN
        (SELECT 
            c.CompanyId AS CompanyId,
            c.CompanyName AS CompanyName
        FROM CF01_Company c
        WHERE c.IsActive=1) 
        AS Company
        ON CosmeticFormulation.CompanyId = Company.CompanyId
        LEFT JOIN
        (SELECT 
            r.CosmeticFormulationId AS CosmeticFormulationId,
            r.IsFDACosmetic AS IsFDACosmetic,
            (case when (r.LabelElement like ',CHAR(39),'%1%',CHAR(39),') then ',CHAR(39), 'Yes',CHAR(39),' else ',CHAR(39),'No',CHAR(39),' end) AS LanguageIssue,
            (case when (r.LabelElement like ',CHAR(39),'%2%',CHAR(39),') then ',CHAR(39), 'Yes',CHAR(39),' else ',CHAR(39),'No',CHAR(39),' end) AS PlaceBusinessIssue,
            (case when (r.LabelElement like ',CHAR(39),'%3%',CHAR(39),') then ',CHAR(39), 'Yes',CHAR(39),' else ',CHAR(39),'No',CHAR(39),' end) AS NetQuantityIssue,
            (case when (r.LabelElement like ',CHAR(39),'%4%',CHAR(39),') then ',CHAR(39), 'Yes',CHAR(39),' else ',CHAR(39),'No',CHAR(39),' end) AS WarningStatementIssue,
            (case when (r.LabelClaim like   ',CHAR(39),'%1%',CHAR(39),') then ',CHAR(39), 'Yes',CHAR(39),' else ',CHAR(39),'No',CHAR(39),' end) AS NoDrugFactsLabelingClaim,
            (case when (r.LabelClaim like ',CHAR(39),'%2%',CHAR(39),') then ',CHAR(39), 'Yes',CHAR(39),' else ',CHAR(39),'No',CHAR(39),' end) AS WithDrugFactsLabelingClaim,
            (case when (r.LabelClaim like ',CHAR(39),'%3%',CHAR(39),') then ',CHAR(39), 'Yes',CHAR(39),' else ',CHAR(39),'No',CHAR(39),' end) AS MedicalDeviceClaim,
            (case when (r.LabelClaim like ',CHAR(39),'%4%',CHAR(39),') then ',CHAR(39), 'Yes',CHAR(39),' else ',CHAR(39),'No',CHAR(39),' end) AS FDAApprovedRegisteredClaim,
            (case when (r.IngredientIssue like ',CHAR(39),'%1%',CHAR(39),') then ',CHAR(39), 'Yes',CHAR(39),' else ',CHAR(39),'No',CHAR(39),' end) AS ColorAdditiveIssue,
            (case when (r.IngredientIssue like ',CHAR(39),'%2%',CHAR(39),') then ',CHAR(39), 'Yes',CHAR(39),' else ',CHAR(39),'No',CHAR(39),' end) AS ProstaglandinAnalogue,
            (case when (r.Other = ',CHAR(39),'PROFESSIONAL USE ONLY COSMETIC',CHAR(39),') then ',CHAR(39),'Yes',CHAR(39),' else ',CHAR(39),'No',CHAR(39),' end) AS ProfessionalUseOnly 
        FROM CF01_ResearchQuestion r
        WHERE r.IsActive=1) 
        AS ResearchQuestion
        ON CosmeticFormulation.CosmeticFormulationId = ResearchQuestion.CosmeticFormulationId WHERE ');
   DECLARE first_condition INT(1) DEFAULT TRUE;
   DECLARE cpis_string TEXT(40) DEFAULT CONCAT('RegistrationNumber like ',CHAR(39));
   DECLARE brand_string TEXT(60) DEFAULT CONCAT('Brand.Brands LIKE ',CHAR(39),'%');
   DECLARE status_string TEXT(45) DEFAULT CONCAT('StatusDescription like ',CHAR(39));
   DECLARE company_string TEXT(50) DEFAULT CONCAT('MATCH(Company.CompanyName) AGAINST(',CHAR(39));
   DECLARE full_text_string_2nd_part TEXT(75) DEFAULT CONCAT('*',CHAR(39),' IN BOOLEAN MODE)');
   DECLARE index_string_2nd_part TEXT(75) DEFAULT CONCAT('%',CHAR(39));
--    SELECT query_v FROM DUAL;
--   SELECT first_condition FROM DUAL;
--   SELECT cpis_string FROM DUAL;
--   SELECT brand_string FROM DUAL;
--   SELECT status_string FROM DUAL;
--   SELECT company_string FROM DUAL;
--   SELECT full_text_string_2nd_part FROM DUAL;
--   SELECT index_string_2nd_part FROM DUAL;
   IF LENGTH(brand_v) > 3 THEN
      SET first_condition = FALSE;
      SET query_v = CONCAT(query_v,brand_string,brand_v,index_string_2nd_part);
   END IF;
   IF LENGTH(cpis_v) > 3 THEN
      IF first_condition THEN
         SET first_condition = FALSE;
         SET query_v = CONCAT(query_v,cpis_string,cpis_v,index_string_2nd_part);
      ELSE
         SET query_v = CONCAT(query_v,' AND ',cpis_string,cpis_v,index_string_2nd_part);
      END IF;
   END IF;
   IF LENGTH(status_v) > 3 THEN
      IF first_condition THEN
         SET first_condition = FALSE;
         SET query_v = CONCAT(query_v,status_string,status_v,index_string_2nd_part);
      ELSE
         SET query_v = CONCAT(query_v,' AND ',status_string,status_v,index_string_2nd_part);
      END IF;
   END IF;
   IF LENGTH(company_name_v) > 3 THEN
      IF first_condition THEN
         SET first_condition = FALSE;
         SET query_v = CONCAT(query_v,company_string,company_name_v,full_text_string_2nd_part);
      ELSE
         SET query_v = CONCAT(query_v,' AND ',company_string,company_name_v,full_text_string_2nd_part);
      END IF;
   END IF;
   IF NOT first_condition THEN
      SET @query_v = CONCAT(query_v,' LIMIT ',start_index_v,',20;');
--      SELECT query_v FROM DUAL;
      SET @DynamicSQL = @query_v;
      PREPARE stmt FROM @DynamicSQL;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;
   END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_REPORT_2511_SP`(IN `_status` VARCHAR(100), IN `_company` VARCHAR(100), IN `_registrationnumber` VARCHAR(100), IN `_establishmentname` VARCHAR(100), IN `_companyid` INT)
    NO SQL
CASE WHEN _companyid = 0 THEN
(select `a`.`CompanyId` AS `companyid`,
`company`.`CompanyName` AS `companyname`,
`company`.`UserName` AS `username`,
`a`.`CosmeticEstablishmentId` AS `cosmeticestablishmentid`,
`a`.`EstablishmentType` AS `establishmenttype`,
(case when (`a`.`EstablishmentType` like '%1%') then 'Manufacturer' else '' end) AS `manufacturer`,
(case when (`a`.`EstablishmentType` like '%2%') then 'Packer' else '' end) AS `packer`,
`a`.`RegistrationNumber` AS `registrationnumber`,
`a`.`EstablishmentName` AS `establishmentname`,
cast(`a`.`RegisteredDate` as date) AS `registereddate`,
cast(`a`.`AmendedDate` as date) AS `amendeddate`,
`b`.`StateId` AS `stateid`,
`b`.`CountryId` AS `countryid`,
`b`.`StreetAddress` AS `streetaddress`,
`b`.`City` AS `city`,
`b`.`PostalCode` AS `postalcode`,
(case when isnull(`e`.`StateName`) then `b`.`OptionalState` else `e`.`StateName` end) AS `statename`,
`f`.`CountryName` AS `countryname`,
`b`.`OptionalState` AS `optionalstate`,
`b`.`IsActive` AS `isactive`,
`c`.`StatusDescription` AS `statusdescription` from (((((`Appian`.`CF01_CosmeticEstablishment` `a` 
left join `Appian`.`CF01_Company` `company` on(((`a`.`CompanyId` = `company`.`CompanyId`) and (`company`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Address` `b` on(((`b`.`DocumentTypeId` = 1) and (`b`.`ObjectId` = `a`.`CosmeticEstablishmentId`) and (`b`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Status_R` `c` on(((`a`.`StatusId` = `c`.`StatusId`) and (`c`.`IsActive` = 1)))) 
left join `Appian`.`CF01_State_R` `e` on((`e`.`StateId` = `b`.`StateId`))) 
left join `Appian`.`CF01_Country_R` `f` on((`f`.`CountryId` = `b`.`CountryId`))) 
where ((`a`.`IsActive` = 1) and (`a`.`StatusId` <> 100)
and IFNULL(`c`.`StatusDescription`,'') LIKE CONCAT('%',_status,'%')
and IFNULL(`company`.`CompanyName`,'') LIKE CONCAT('%',_company,'%')
and IFNULL(`a`.`RegistrationNumber`,'') LIKE CONCAT('%',_registrationnumber,'%')
and IFNULL(`a`.`EstablishmentName`,'') LIKE CONCAT('%',_establishmentname,'%')))LIMIT 500;
ELSE
(select `a`.`CompanyId` AS `companyid`,
`company`.`CompanyName` AS `companyname`,
`company`.`UserName` AS `username`,
`a`.`CosmeticEstablishmentId` AS `cosmeticestablishmentid`,
`a`.`EstablishmentType` AS `establishmenttype`,
(case when (`a`.`EstablishmentType` like '%1%') then 'Manufacturer' else '' end) AS `manufacturer`,
(case when (`a`.`EstablishmentType` like '%2%') then 'Packer' else '' end) AS `packer`,
`a`.`RegistrationNumber` AS `registrationnumber`,
`a`.`EstablishmentName` AS `establishmentname`,
cast(`a`.`RegisteredDate` as date) AS `registereddate`,
cast(`a`.`AmendedDate` as date) AS `amendeddate`,
`b`.`StateId` AS `stateid`,
`b`.`CountryId` AS `countryid`,
`b`.`StreetAddress` AS `streetaddress`,
`b`.`City` AS `city`,
`b`.`PostalCode` AS `postalcode`,
(case when isnull(`e`.`StateName`) then `b`.`OptionalState` else `e`.`StateName` end) AS `statename`,
`f`.`CountryName` AS `countryname`,
`b`.`OptionalState` AS `optionalstate`,
`b`.`IsActive` AS `isactive`,
`c`.`StatusDescription` AS `statusdescription` from (((((`Appian`.`CF01_CosmeticEstablishment` `a` 
left join `Appian`.`CF01_Company` `company` on(((`a`.`CompanyId` = `company`.`CompanyId`) and (`company`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Address` `b` on(((`b`.`DocumentTypeId` = 1) and (`b`.`ObjectId` = `a`.`CosmeticEstablishmentId`) and (`b`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Status_R` `c` on(((`a`.`StatusId` = `c`.`StatusId`) and (`c`.`IsActive` = 1)))) 
left join `Appian`.`CF01_State_R` `e` on((`e`.`StateId` = `b`.`StateId`))) 
left join `Appian`.`CF01_Country_R` `f` on((`f`.`CountryId` = `b`.`CountryId`))) 
where ((`a`.`IsActive` = 1) and (`a`.`StatusId` <> 100) and `a`.`CompanyId`= _companyid
and IFNULL(`c`.`StatusDescription`,'') LIKE CONCAT(_status,'%')
and IFNULL(`company`.`CompanyName`,'') LIKE CONCAT(_company,'%')
and IFNULL(`a`.`RegistrationNumber`,'') LIKE CONCAT(_registrationnumber,'%')
and IFNULL(`a`.`EstablishmentName`,'') LIKE CONCAT(_establishmentname,'%')))LIMIT 500;
END CASE$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_REPORT_2512_Filer_SP`(IN `brand_v` VARCHAR(100), IN `cpis_v` VARCHAR(100), IN `status_v` VARCHAR(100), IN `company_name_v` VARCHAR(100), IN `start_index_v` INT)
BEGIN
   DECLARE query_v TEXT(10000) DEFAULT CONCAT(' SELECT  
         CosmeticFormulation.RegistrationNumber AS CPIS,
         Brand.Brands AS Brands,
         Status.StatusDescription AS Status,
         Company.CompanyName AS CompanyName,
         Company.AccountName AS AccountName,
         CosmeticFormulation.FilerType AS FilerType,
         AuthorizedIndividual.FullName AS AuthorizedIndividualName,
         AuthorizedIndividual.Email AS AuthorizedIndividualEmail,
         AlternativeAuthorizedIndividual.FullName AS AlternativeAuthorizedIndividualName,
         AlternativeAuthorizedIndividual.Email AS AlternativeAuthorizedIndividualEmail,
         CosmeticFormulation.IsPaperFiling AS PaperForm,
         CosmeticFormulation.CosmeticFormulationId AS CosmeticFormulationId
      FROM (SELECT 
            cf.CosmeticFormulationId AS CosmeticFormulationId,
            cf.RegistrationNumber AS RegistrationNumber,
            cf.StatusId AS StatusId,
            cf.CompanyId AS CompanyId,
            cf.FilerType AS FilerType,
            cf.AuthorizedIndividualId AS AuthorizedIndividualId,
            cf.AlternativeAuthorizedIndividualId AS AlternativeAuthorizedIndividualId,
            cf.IsPaperFiling AS IsPaperFiling
         FROM CF01_CosmeticFormulation cf 
         WHERE cf.IsActive=1
         AND cf.StatusId IN (1,2,3,4,5,103,104,105,106,107,108,109,110)) AS CosmeticFormulation
         LEFT JOIN (SELECT 
            b.BrandDocumentId AS BrandDocumentId,
            b.CosmeticFormulationId AS CosmeticFormulationId,
            GROUP_CONCAT(b.BrandDescription) AS Brands,
            GROUP_CONCAT(b.ProductWebsite) AS Websites
         FROM CF01_Brand b
         WHERE b.IsActive=1 GROUP BY b.CosmeticFormulationId) AS Brand
      ON CosmeticFormulation.CosmeticFormulationId = Brand.CosmeticFormulationId
      LEFT JOIN (SELECT 
            s.StatusId AS StatusId,
            s.StatusDescription AS StatusDescription
         FROM CF01_Status_R s
         WHERE s.IsActive=1) AS Status
      ON CosmeticFormulation.StatusId = Status.StatusId
      LEFT JOIN (SELECT
            c.CompanyId AS CompanyId,
            c.CompanyName AS CompanyName,
            CONCAT_WS(c.FirstName," ",c.LastName) AS AccountName
         FROM CF01_Company c
         WHERE c.IsActive=1) AS Company
      ON CosmeticFormulation.CompanyId = Company.CompanyId
      LEFT JOIN (SELECT
            f.FilerId AS FilerId,
            CONCAT_WS(f.FirstName," ",f.LastName) AS FullName,
            f.Email AS Email
         FROM CF01_Filer f
         WHERE f.IsActive=1) AS AuthorizedIndividual
      ON CosmeticFormulation.AuthorizedIndividualId = AuthorizedIndividual.FilerId
      LEFT JOIN (SELECT 
            f.FilerId AS FilerId,
            CONCAT_WS(f.FirstName," ",f.LastName) AS FullName,
            f.Email AS Email
         FROM CF01_Filer f
         WHERE f.IsActive=1) AS AlternativeAuthorizedIndividual
      ON CosmeticFormulation.AlternativeAuthorizedIndividualId = AlternativeAuthorizedIndividual.FilerId
      WHERE ');
   DECLARE first_condition INT(1) DEFAULT TRUE;
   DECLARE cpis_string TEXT(40) DEFAULT CONCAT('RegistrationNumber like ',CHAR(39));
   DECLARE brand_string TEXT(60) DEFAULT CONCAT('Brand.Brands LIKE ',CHAR(39),'%');
   DECLARE status_string TEXT(45) DEFAULT CONCAT('StatusDescription like ',CHAR(39));
   DECLARE company_string TEXT(50) DEFAULT CONCAT('MATCH(Company.CompanyName) AGAINST(',CHAR(39));
   DECLARE full_text_string_2nd_part TEXT(75) DEFAULT CONCAT('*',CHAR(39),' IN BOOLEAN MODE)');
   DECLARE index_string_2nd_part TEXT(75) DEFAULT CONCAT('%',CHAR(39));
--   SELECT query_v FROM DUAL;
--   SELECT first_condition FROM DUAL;
--   SELECT cpis_string FROM DUAL;
--   SELECT brand_string FROM DUAL;
--   SELECT status_string FROM DUAL;
--   SELECT company_string FROM DUAL;
--   SELECT full_text_string_2nd_part FROM DUAL;
--   SELECT index_string_2nd_part FROM DUAL;
   IF LENGTH(brand_v) > 3 THEN
      SET first_condition = FALSE;
      SET query_v = CONCAT(query_v,brand_string,brand_v,index_string_2nd_part);
   END IF;
   IF LENGTH(cpis_v) > 3 THEN
      IF first_condition THEN
         SET first_condition = FALSE;
         SET query_v = CONCAT(query_v,cpis_string,cpis_v,index_string_2nd_part);
      ELSE
         SET query_v = CONCAT(query_v,' AND ',cpis_string,cpis_v,index_string_2nd_part);
      END IF;
   END IF;
   IF LENGTH(status_v) > 3 THEN
      IF first_condition THEN
         SET first_condition = FALSE;
         SET query_v = CONCAT(query_v,status_string,status_v,index_string_2nd_part);
      ELSE
         SET query_v = CONCAT(query_v,' AND ',status_string,status_v,index_string_2nd_part);
      END IF;
   END IF;
   IF LENGTH(company_name_v) > 3 THEN
      IF first_condition THEN
         SET first_condition = FALSE;
         SET query_v = CONCAT(query_v,company_string,company_name_v,full_text_string_2nd_part);
      ELSE
         SET query_v = CONCAT(query_v,' AND ',company_string,company_name_v,full_text_string_2nd_part);
      END IF;
   END IF;
   IF NOT first_condition THEN
      SET @query_v = CONCAT(query_v,' LIMIT ',start_index_v,',20;');
--      SELECT query_v FROM DUAL;
      SET @DynamicSQL = @query_v;
      PREPARE stmt FROM @DynamicSQL;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;
   END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_REPORT_2512_SP`(IN `_brand` VARCHAR(100), IN `_ingredient` VARCHAR(100), IN `_labeler` VARCHAR(100), IN `_category` VARCHAR(100), IN `_status` VARCHAR(100), IN `_company` VARCHAR(100), IN `_companyid` INT)
    NO SQL
CASE WHEN _companyid = 0 THEN
(select `c`.`CompanyId` AS `companyid`,
`company`.`CompanyName` AS `companyname`,
`company`.`UserName` AS `username`,
`c`.`CosmeticFormulationId` AS `cosmeticformulationid`,
`c`.`RegistrationNumber` AS `registrationnumber`,
`b`.`LabelerId` AS `labelerid`,
`b`.`LabelerNumber` AS `labelernumber`,
`b`.`LabelerName` AS `labelername`,
`c`.`LabelerType` AS `labelertype`,
(case when (`c`.`LabelerType` like '%MANUFACTURER%') then 'Manufacturer' else '' end) AS `manufacturer`,
(case when (`c`.`LabelerType` like '%PACKER%') then 'Packer' else '' end) AS `packer`,
(case when (`c`.`LabelerType` like '%DISTRIBUTOR%') then 'Distributor' else '' end) AS `distributor`,
`d`.`StreetAddress` AS `streetaddress`,
`d`.`City` AS `city`,
(case when isnull(`e`.`StateName`) then `d`.`OptionalState` else `e`.`StateName` end) AS `statename`,
`d`.`PostalCode` AS `postalcode`,
`f`.`CountryName` AS `countryname`,
`g`.`CategoryCode` AS `categorycode`,
`g`.`CategoryDescription` AS `categorydescription`,
`i`.`StatusDescription` AS `statusdescription`,
`c`.`RegisteredDate` AS `fileddate`,
`c`.`AmendedDate` AS `amendeddate`,
Brand.Brands AS `brands`,
Ingredient.Ingredients AS `ingredients` 
from (((((((((`Appian`.`CF01_CosmeticFormulation` `c` 
left join `Appian`.`CF01_Company` `company` on(((`c`.`CompanyId` = `company`.`CompanyId`) and (`company`.`IsActive` = 1)))) 
left join 
    (SELECT group_concat(`a`.`BrandDescription` separator ',
 ') AS `Brands`,
        a.CosmeticFormulationId AS CosmeticFormulationId
    FROM `Appian`.`CF01_Brand` `a`
    WHERE `a`.`IsActive` = 1 GROUP BY a.CosmeticFormulationId) AS Brand
on(((`c`.`CosmeticFormulationId` = `Brand`.`CosmeticFormulationId`)))) 
left join `Appian`.`CF01_Labeler` `b` on(((`b`.`LabelerId` = `c`.`LabelerId`) and (`b`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Address` `d` on(((`d`.`DocumentTypeId` = 3) and (`d`.`ObjectId` = `b`.`LabelerId`) and (`d`.`IsActive` = 1)))) 
left join `Appian`.`CF01_State_R` `e` on((`e`.`StateId` = `d`.`StateId`))) 
left join `Appian`.`CF01_Country_R` `f` on((`f`.`CountryId` = `d`.`CountryId`))) 
left join `Appian`.`CF01_Category_R` `g` on(((`g`.`CategoryId` = `c`.`CategoryId`) and (`g`.`IsActive` = 1)))) 
left join 
    (SELECT group_concat(`h`.`IngredientName` separator ',
 ') AS `Ingredients`,
        h.CosmeticFormulationId AS CosmeticFormulationId
    FROM `Appian`.`CF01_Ingredient_CosmeticFormulation` `h` 
    WHERE `h`.`IsActive` = 1 GROUP BY h.CosmeticFormulationId) AS Ingredient 
on(((`Ingredient`.`CosmeticFormulationId` = `c`.`CosmeticFormulationId`)))) 
left join `Appian`.`CF01_Status_R` `i` on(((`i`.`StatusId` = `c`.`StatusId`) and (`i`.`IsActive` = 1)))) 
where ((`c`.`IsActive` = 1) and (`c`.`StatusId` <> 100)
and IFNULL(Brand.Brands,"") LIKE concat(_brand,'%') 
and IFNULL(Ingredient.Ingredients,"") LIKE concat(_ingredient,'%') 
and IFNULL(b.LabelerName,"") LIKE concat(_labeler,'%')
and IFNULL(g.CategoryDescription,"") LIKE concat(_category,'%') 
and IFNULL(i.StatusDescription,"") LIKE concat(_status,'%') 
and IFNULL(company.CompanyName,"") LIKE concat(_company,'%')))LIMIT 500;
ELSE 
(select `c`.`CompanyId` AS `companyid`,
`company`.`CompanyName` AS `companyname`,
`company`.`UserName` AS `username`,
`c`.`CosmeticFormulationId` AS `cosmeticformulationid`,
`c`.`RegistrationNumber` AS `registrationnumber`,
`b`.`LabelerId` AS `labelerid`,
`b`.`LabelerNumber` AS `labelernumber`,
`b`.`LabelerName` AS `labelername`,
`c`.`LabelerType` AS `labelertype`,
(case when (`c`.`LabelerType` like '%MANUFACTURER%') then 'Manufacturer' else '' end) AS `manufacturer`,
(case when (`c`.`LabelerType` like '%PACKER%') then 'Packer' else '' end) AS `packer`,
(case when (`c`.`LabelerType` like '%DISTRIBUTOR%') then 'Distributor' else '' end) AS `distributor`,
`d`.`StreetAddress` AS `streetaddress`,
`d`.`City` AS `city`,
(case when isnull(`e`.`StateName`) then `d`.`OptionalState` else `e`.`StateName` end) AS `statename`,
`d`.`PostalCode` AS `postalcode`,
`f`.`CountryName` AS `countryname`,
`g`.`CategoryCode` AS `categorycode`,
`g`.`CategoryDescription` AS `categorydescription`,
`i`.`StatusDescription` AS `statusdescription`,
`c`.`RegisteredDate` AS `fileddate`,
`c`.`AmendedDate` AS `amendeddate`,
Brand.Brands AS `brands`,
Ingredient.Ingredients AS `ingredients` 
from (((((((((`Appian`.`CF01_CosmeticFormulation` `c` 
left join `Appian`.`CF01_Company` `company` on(((`c`.`CompanyId` = `company`.`CompanyId`) and (`company`.`IsActive` = 1)))) 
left join 
    (SELECT group_concat(`a`.`BrandDescription` separator ',
 ') AS `Brands`,
        a.CosmeticFormulationId AS CosmeticFormulationId
    FROM `Appian`.`CF01_Brand` `a`
    WHERE `a`.`IsActive` = 1 GROUP BY a.CosmeticFormulationId) AS Brand
on(((`c`.`CosmeticFormulationId` = `Brand`.`CosmeticFormulationId`)))) 
left join `Appian`.`CF01_Labeler` `b` on(((`b`.`LabelerId` = `c`.`LabelerId`) and (`b`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Address` `d` on(((`d`.`DocumentTypeId` = 3) and (`d`.`ObjectId` = `b`.`LabelerId`) and (`d`.`IsActive` = 1)))) 
left join `Appian`.`CF01_State_R` `e` on((`e`.`StateId` = `d`.`StateId`))) 
left join `Appian`.`CF01_Country_R` `f` on((`f`.`CountryId` = `d`.`CountryId`))) 
left join `Appian`.`CF01_Category_R` `g` on(((`g`.`CategoryId` = `c`.`CategoryId`) and (`g`.`IsActive` = 1)))) 
left join 
    (SELECT group_concat(`h`.`IngredientName` separator ',
 ') AS `Ingredients`,
        h.CosmeticFormulationId AS CosmeticFormulationId
    FROM `Appian`.`CF01_Ingredient_CosmeticFormulation` `h` 
    WHERE `h`.`IsActive` = 1 GROUP BY h.CosmeticFormulationId) AS Ingredient 
on(((`Ingredient`.`CosmeticFormulationId` = `c`.`CosmeticFormulationId`)))) 
left join `Appian`.`CF01_Status_R` `i` on(((`i`.`StatusId` = `c`.`StatusId`) and (`i`.`IsActive` = 1)))) 
where ((`c`.`IsActive` = 1) and (`c`.`StatusId` <> 100)
and c.CompanyId = _companyid 
and IFNULL(Brand.Brands,"") LIKE concat('%',_brand,'%') 
and IFNULL(Ingredient.Ingredients,"") LIKE concat('%',_ingredient,'%') 
and IFNULL(b.LabelerName,"") LIKE concat(_labeler,'%')
and IFNULL(g.CategoryDescription,"") LIKE concat(_category,'%') 
and IFNULL(i.StatusDescription,"") LIKE concat(_status,'%') 
and IFNULL(company.CompanyName,"") LIKE concat(_company,'%'))) LIMIT 500;
END CASE$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_REPORT_2512_Ingredient_Product_SP`(
	IN brand_v VARCHAR(100),
    IN status_v VARCHAR(75),
    IN company_v VARCHAR(100),
    IN ingredient_id_and_v VARCHAR(4000),
    IN ingredient_id_or_v VARCHAR(4000),
    IN ingredient_id_not_v VARCHAR(4000),
    IN limit_v INT)
BEGIN 
	-- Variables Declaration
	DECLARE query_v TEXT(15000) DEFAULT 'SELECT * FROM CF01_REPORT_2512_Ingredient_Product_VW ccf';
	DECLARE brand_join_string TEXT(85) DEFAULT 'LEFT JOIN CF01_Brand cb ON ccf.CosmeticFormulationId = cb.CosmeticFormulationId';
	-- DECLARE company_join_string TEXT(65) DEFAULT 'LEFT JOIN CF01_Company cc ON ccf.CompanyId = cc.CompanyId';
    DECLARE brand_string TEXT(50) DEFAULT CONCAT('MATCH(cb.BrandDescription) AGAINST(',CHAR(39),'?',CHAR(39),' IN BOOLEAN MODE)');
	DECLARE company_string TEXT(50) DEFAULT CONCAT('MATCH(CompanyName) AGAINST(',CHAR(39),'?',CHAR(39),' IN BOOLEAN MODE)');
	DECLARE status_string TEXT(40) DEFAULT CONCAT('FIND_IN_SET(StatusId,',CHAR(39),'?',CHAR(39),')');
    DECLARE ingredient_and_string TEXT(100);
    DECLARE ingredient_or_string  TEXT(100);
    DECLARE ingredient_not_string TEXT(100);
    DECLARE ingredient_string TEXT(1000);
    DECLARE where_clause TEXT(15000) DEFAULT 'WHERE ';
    DECLARE limit_clause TEXT(20) DEFAULT ' LIMIT ';

	-- Show Declaration Results
	-- SELECT query_v FROM DUAL;
	-- SELECT brand_join_string FROM DUAL;
	-- SELECT company_join_string FROM DUAL;
	-- SELECT brand_string FROM DUAL;
	-- SELECT company_string FROM DUAL;
	-- SELECT status_string FROM DUAL;
    
	-- Brand Join Logic
	IF LENGTH(brand_v) > 3 THEN
		SET brand_string = REPLACE(brand_string,'?',CONCAT(brand_v,'*'));
	ELSE
		SET brand_join_string = NULL;
		SET brand_string = TRUE;
	END IF;
	
    -- Company Join Logic
	IF LENGTH(company_v) > 3 THEN
		SET company_string = REPLACE(company_string,'?',CONCAT(company_v,'*'));
	ELSE
		SET company_string = TRUE;
	END IF;

	-- Status Logic
	IF LENGTH(status_v) > 0 THEN
		SET status_string = REPLACE(status_string,'?',status_v);
	ELSE
		SET status_string = TRUE;
	END IF;
    
	-- Ingredient Logic
    -- AND
	IF LENGTH(ingredient_id_and_v) > 0 THEN
		SET ingredient_and_string = CONCAT('(FIND_IN_SET(',
			REPLACE(ingredient_id_and_v,',',',IngredientIds) AND FIND_IN_SET('),
			',IngredientIds))');
	ELSE
		SET ingredient_and_string = TRUE;
	END IF;
    -- OR
    IF LENGTH(ingredient_id_or_v) > 0 THEN
		SET ingredient_or_string = CONCAT('(FIND_IN_SET(',
			REPLACE(ingredient_id_or_v,',',',IngredientIds) OR FIND_IN_SET('),
			',IngredientIds))');
	ELSE
		SET ingredient_or_string = TRUE;
	END IF;
    -- NOT
    IF LENGTH(ingredient_id_not_v) > 0 THEN
		SET ingredient_not_string = CONCAT('NOT FIND_IN_SET(',
			REPLACE(ingredient_id_not_v,',',',IngredientIds) AND NOT FIND_IN_SET('),
			',IngredientIds)');
	ELSE
		SET ingredient_not_string = TRUE;
	END IF;
    -- SELECT ingredient_and_string,ingredient_or_string,ingredient_not_string FROM DUAL;
    
    -- LIMIT Logic
    IF limit_v > 0 THEN
		SET limit_clause = CONCAT(limit_clause,limit_v);
	ELSE
		SET limit_clause = NULL;
	END IF;
    SET ingredient_string = CONCAT_WS(' AND ',CONCAT('(',CONCAT_WS(' AND ',ingredient_and_string,ingredient_or_string),')'),ingredient_not_string);
    -- SELECT ingredient_string FROM DUAL;
 
 -- Form and Show Query
    SET where_clause = CONCAT(where_clause,CONCAT_WS(' AND ',brand_string,company_string,status_string,ingredient_string));
    -- SELECT where_clause FROM DUAL;
    SET query_v = CONCAT_WS(' ',query_v,brand_join_string,where_clause,limit_clause);
	-- SELECT query_v FROM DUAL;
	
	-- Execute query
	SET @DynamicSQL = query_v;
	PREPARE stmt FROM @DynamicSQL;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_REPORT_2512_Labeler_Date_SP`(IN `_brand` VARCHAR(100), IN `_company` CHAR(100), IN `_cpis` CHAR(50), IN `_labelername` CHAR(100), IN `_labelernumber` INT, IN `_limit` INT, IN `_status` INT)
BEGIN
	-- Declare variables
	DECLARE query_start_v VARCHAR(10000) DEFAULT
    'SELECT  
        CosmeticFormulation.RegistrationNumber AS CPIS,
        Brand.Brands AS Brands,
        Status.StatusDescription AS Status,
        Company.CompanyName AS CompanyName,
        Brand.Websites AS Websites,
        Labeler.LabelerNumber AS LabelerNumber,
        Labeler.StatusDescription AS LabelerStatus,
        Labeler.LabelerName AS LabelerName,
        CosmeticFormulation.LabelerType AS LabelerType,
        Labeler.LabelerAddress AS LabelerAddress,
        CosmeticFormulation.RegisteredDate AS SubmittedDate,
        CosmeticFormulation.VerifiedDate AS VerifiedDate,
        CosmeticFormulation.DiscontinuedDate AS DiscontinuedDate,
        CosmeticFormulation.AmendedDate AS AmendedDate,
        CosmeticFormulation.ApprovedDate AS ApprovedDate,
        CosmeticFormulation.ApprovedBy AS ApprovedBy,
        CosmeticFormulation.CosmeticFormulationId AS CosmeticFormulationId,
        Labeler.LabelerId AS LabelerId

    FROM
        (SELECT 
            cf.CosmeticFormulationId AS CosmeticFormulationId,
            cf.RegistrationNumber AS RegistrationNumber,
            cf.LabelerType AS LabelerType,
            cf.RegisteredDate AS RegisteredDate,
            cf.VerifiedDate AS VerifiedDate,
            cf.DiscontinuedDate AS DiscontinuedDate,
            cf.AmendedDate AS AmendedDate,
            cf.ApprovedDate AS ApprovedDate,
            cf.ApprovedBy AS ApprovedBy,
            cf.StatusId AS StatusId,
            cf.CompanyId AS CompanyId,
            cf.LabelerId AS LabelerId
        FROM CF01_CosmeticFormulation cf 
        WHERE cf.IsActive=1 AND cf.StatusId IN (1,2,3,4,5,103,104,105,106,107,108,109,110)) AS CosmeticFormulation
        LEFT JOIN
        (SELECT 
            s.StatusId AS StatusId,
            s.StatusDescription AS StatusDescription
        FROM CF01_Status_R s
        WHERE s.IsActive=1) 
        AS Status
        ON CosmeticFormulation.StatusId = Status.StatusId
        LEFT JOIN
        (SELECT 
            c.CompanyId AS CompanyId,
            c.CompanyName AS CompanyName
        FROM CF01_Company c
        WHERE c.IsActive=1) 
        AS Company
        ON CosmeticFormulation.CompanyId = Company.CompanyId ';
    
    DECLARE query_middle_v VARCHAR(5000) DEFAULT
        ' (SELECT 
            l.LabelerId AS LabelerId,
            l.LabelerNumber AS LabelerNumber,
            l.LabelerName AS LabelerName,
            status.StatusDescription AS StatusDescription,
            CONCAT_WS("",a.StreetAddress,", ",a.City,", ",a.State," ",a.Zip," ",a.Country) AS LabelerAddress
        FROM CF01_Labeler l 
            LEFT JOIN CF01_Address_Concat_VW a ON a.DocumentTypeId=3 and a.ObjectId = l.LabelerId
            LEFT JOIN CF01_Status_R status ON status.IsActive=1 and status.StatusId = l.StatusId
        WHERE l.IsActive=1';
        
    DECLARE query_end_v VARCHAR(5000) DEFAULT
        ' ) AS Labeler
		ON CosmeticFormulation.LabelerId = Labeler.LabelerId
		
		LEFT JOIN
		(SELECT 
			b.BrandDocumentId AS BrandDocumentId,
			b.CosmeticFormulationId AS CosmeticFormulationId,
			GROUP_CONCAT(b.BrandDescription) AS Brands,
			GROUP_CONCAT(b.ProductWebsite) AS Websites
		FROM
			CF01_Brand b
		WHERE
			b.IsActive = 1
		GROUP BY
			b.CosmeticFormulationId) AS Brand
		ON CosmeticFormulation.CosmeticFormulationId = Brand.CosmeticFormulationId';
	DECLARE cpis_string VARCHAR(300) DEFAULT CONCAT('CosmeticFormulation.RegistrationNumber LIKE ',CHAR(39),'%?%',CHAR(39));
	DECLARE brand_string VARCHAR(300) DEFAULT CONCAT('Brand.Brands LIKE ',CHAR(39),'%?%',CHAR(39));
	DECLARE status_string VARCHAR(100) DEFAULT 'Status.StatusId = ?';
	DECLARE company_string VARCHAR(400) DEFAULT CONCAT('MATCH(Company.CompanyName) AGAINST(',CHAR(39),'?*',CHAR(39),' IN BOOLEAN MODE)');
	DECLARE labelername_string VARCHAR(400) DEFAULT CONCAT(' AND MATCH(l.LabelerName) AGAINST(',CHAR(39),'?',CHAR(39),' IN BOOLEAN MODE)');
    -- DECLARE labelername_string VARCHAR(400) DEFAULT CONCAT('Labeler.LabelerName LIKE ',CHAR(39),'%?%',CHAR(39));
	DECLARE labelernumber_string VARCHAR(100) DEFAULT 'Labeler.LabelerNumber = ?';
    DECLARE where_clause VARCHAR(2000) DEFAULT 'WHERE ';
    DECLARE limit_clause VARCHAR(100) DEFAULT 'LIMIT ';
	
	-- CPIS logic
	IF LENGTH(_cpis) > 0 THEN
		SET cpis_string = REPLACE(cpis_string,'?',_cpis);
	ELSE
		SET cpis_string = TRUE;
	END IF;
	
    -- Brand logic
    IF LENGTH(_brand) > 3 THEN
		SET brand_string = REPLACE(brand_string,'?',_brand);
	ELSE
		SET brand_string = TRUE;		
	END IF;
	
    -- Status logic
	IF _status > 0 THEN
		SET status_string = REPLACE(status_string,'?',_status);
	ELSE
		SET status_string = TRUE;		
	END IF;

	-- Company logic
	IF LENGTH(_company) > 3 THEN
		SET company_string = REPLACE(company_string,'?',_company);
	ELSE
		SET company_string = TRUE;
	END IF;
	
	-- Labeler name logic
	IF LENGTH(_labelername) > 3 THEN
		SET labelername_string = REPLACE(labelername_string,'?',CONCAT("",_labelername,""));
        SET query_middle_v = CONCAT('INNER JOIN', query_middle_v);
	ELSE
		SET labelername_string = NULL;
        SET query_middle_v = CONCAT('LEFT JOIN', query_middle_v);
	END IF;
	
	-- Labeler number logic
    IF _labelernumber > 0 THEN
		SET labelernumber_string = REPLACE(labelernumber_string,'?',_labelernumber);
	ELSE
		SET labelernumber_string = TRUE;
	END IF;
	
    -- Limit logic
    IF _limit > 0 THEN
		SET limit_clause = CONCAT(limit_clause,_limit);
	ELSE
		SET limit_clause = NULL;
	END IF;
    
    -- Query logic
    SET where_clause = CONCAT(where_clause,CONCAT_WS(' AND ',cpis_string,brand_string,status_string,company_string,labelernumber_string));
	SET query_start_v = CONCAT_WS(' ',query_start_v,query_middle_v,labelername_string,query_end_v,where_clause,limit_clause);
    -- SELECT query_v FROM DUAL;
    
    -- Execute query
	SET @DynamicSQL = query_start_v;
	PREPARE stmt FROM @DynamicSQL;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
    
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_REPORT_Account_SP`(
	IN _stat TEXT,
    IN _company TEXT,
    IN _username TEXT,
    IN _email TEXT,
    IN _fromDate TEXT,
    IN _toDate TEXT,
    IN _type TEXT
)
BEGIN
SELECT
	*
FROM
	CF01_REPORT_Account_VW
WHERE
	CASE WHEN LENGTH(_stat) > 0 THEN StatusDescription LIKE _stat ELSE TRUE END
    AND CASE WHEN LENGTH(_company) > 0 THEN CompanyName LIKE CONCAT('%',_company,'%') ELSE TRUE END
    AND CASE WHEN LENGTH(_username) > 0 THEN UserName LIKE CONCAT('%',_username,'%') ELSE TRUE END
    AND CASE WHEN LENGTH(_email) > 0 THEN CompanyEmail LIKE CONCAT('%',_email,'%') ELSE TRUE END
    AND CompanyCreatedOn BETWEEN 
        CASE WHEN _fromDate IS NOT NULL AND _fromDate != '' THEN _fromDate ELSE '1000-01-01' END
        AND CASE WHEN _toDate IS NOT NULL AND _toDate != '' THEN _toDate ELSE '9999-12-31' END
    AND CASE
        WHEN _type = 'paper' THEN Status IN (3)
        WHEN _type = 'online' THEN Status IN (0,1,2)
        ELSE TRUE
		END;
        
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_REPORT_2512_WEBMOD_SP`(IN `_brand` VARCHAR(100), IN `_ingredient` VARCHAR(100), IN `_labeler` VARCHAR(100), IN `_category` VARCHAR(100), IN `_status` VARCHAR(100), IN `_company` VARCHAR(100), IN `_companyid` INT)
    NO SQL
CASE WHEN _companyid = 0 THEN
(select `c`.`CompanyId` AS `companyid`,
`company`.`CompanyName` AS `companyname`,
`c`.`CosmeticFormulationId` AS `cosmeticformulationid`,
`c`.`RegistrationNumber` AS `registrationnumber`,
`b`.`LabelerId` AS `labelerid`,
`b`.`LabelerNumber` AS `labelernumber`,
`b`.`LabelerName` AS `labelername`,
`c`.`LabelerType` AS `labelertype`,
(case when (`c`.`LabelerType` like '%MANUFACTURER%') then 'Manufacturer' else '' end) AS `manufacturer`,
(case when (`c`.`LabelerType` like '%PACKER%') then 'Packer' else '' end) AS `packer`,
(case when (`c`.`LabelerType` like '%DISTRIBUTOR%') then 'Distributor' else '' end) AS `distributor`,
`d`.`StreetAddress` AS `address`,
`d`.`City` AS `city`,
(case when isnull(`e`.`StateName`) then `d`.`OptionalState` else `e`.`StateName` end) AS `statename`,
`d`.`PostalCode` AS `postalcode`,
`f`.`CountryName` AS `countryname`,
`g`.`CategoryCode` AS `categorycode`,
`g`.`CategoryDescription` AS `categorydescription`,
`i`.`StatusDescription` AS `statusdescription`,
`c`.`RegisteredDate` AS `fileddate`,
`c`.`AmendedDate` AS `amendeddate`,
Brand.Brands AS `brands`,
Ingredient.Ingredients AS `ingredients` 
from (((((((((`Appian`.`CF01_CosmeticFormulation` `c` 
left join `Appian`.`CF01_Company` `company` on(((`c`.`CompanyId` = `company`.`CompanyId`) and (`company`.`IsActive` = 1)))) 
left join 
    (SELECT group_concat(`a`.`BrandDescription` separator ',
 ') AS `Brands`,
        a.CosmeticFormulationId AS CosmeticFormulationId
    FROM `Appian`.`CF01_Brand` `a`
    WHERE `a`.`IsActive` = 1 GROUP BY a.CosmeticFormulationId) AS Brand
on(((`c`.`CosmeticFormulationId` = `Brand`.`CosmeticFormulationId`)))) 
left join `Appian`.`CF01_Labeler` `b` on(((`b`.`LabelerId` = `c`.`LabelerId`) and (`b`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Address` `d` on(((`d`.`DocumentTypeId` = 3) and (`d`.`ObjectId` = `b`.`LabelerId`) and (`d`.`IsActive` = 1)))) 
left join `Appian`.`CF01_State_R` `e` on((`e`.`StateId` = `d`.`StateId`))) 
left join `Appian`.`CF01_Country_R` `f` on((`f`.`CountryId` = `d`.`CountryId`))) 
left join `Appian`.`CF01_Category_R` `g` on(((`g`.`CategoryId` = `c`.`CategoryId`) and (`g`.`IsActive` = 1)))) 
left join 
    (SELECT group_concat(`h`.`IngredientName` separator ',
 ') AS `Ingredients`,
        h.CosmeticFormulationId AS CosmeticFormulationId
    FROM `Appian`.`CF01_Ingredient_CosmeticFormulation` `h` 
    WHERE `h`.`IsActive` = 1 GROUP BY h.CosmeticFormulationId) AS Ingredient 
on(((`Ingredient`.`CosmeticFormulationId` = `c`.`CosmeticFormulationId`)))) 
left join `Appian`.`CF01_Status_R` `i` on(((`i`.`StatusId` = `c`.`StatusId`) and (`i`.`IsActive` = 1)))) 
where ((`c`.`IsActive` = 1) and (`c`.`StatusId` IN (2,109))
and IFNULL(Brand.Brands,"") LIKE concat(_brand,'%') 
and IFNULL(Ingredient.Ingredients,"") LIKE concat(_ingredient,'%') 
and IFNULL(b.LabelerName,"") LIKE concat(_labeler,'%')
and IFNULL(g.CategoryDescription,"") LIKE concat(_category,'%') 
and IFNULL(i.StatusDescription,"") LIKE concat(_status,'%') 
and IFNULL(company.CompanyName,"") LIKE concat(_company,'%')))LIMIT 500;
ELSE 
(select `c`.`CompanyId` AS `companyid`,
`company`.`CompanyName` AS `companyname`,
`company`.`UserName` AS `username`,
`c`.`CosmeticFormulationId` AS `cosmeticformulationid`,
`c`.`RegistrationNumber` AS `registrationnumber`,
`b`.`LabelerId` AS `labelerid`,
`b`.`LabelerNumber` AS `labelernumber`,
`b`.`LabelerName` AS `labelername`,
`c`.`LabelerType` AS `labelertype`,
(case when (`c`.`LabelerType` like '%MANUFACTURER%') then 'Manufacturer' else '' end) AS `manufacturer`,
(case when (`c`.`LabelerType` like '%PACKER%') then 'Packer' else '' end) AS `packer`,
(case when (`c`.`LabelerType` like '%DISTRIBUTOR%') then 'Distributor' else '' end) AS `distributor`,
`d`.`StreetAddress` AS `streetaddress`,
`d`.`City` AS `city`,
(case when isnull(`e`.`StateName`) then `d`.`OptionalState` else `e`.`StateName` end) AS `statename`,
`d`.`PostalCode` AS `postalcode`,
`f`.`CountryName` AS `countryname`,
`g`.`CategoryCode` AS `categorycode`,
`g`.`CategoryDescription` AS `categorydescription`,
`i`.`StatusDescription` AS `statusdescription`,
`c`.`RegisteredDate` AS `fileddate`,
`c`.`AmendedDate` AS `amendeddate`,
Brand.Brands AS `brands`,
Ingredient.Ingredients AS `ingredients` 
from (((((((((`Appian`.`CF01_CosmeticFormulation` `c` 
left join `Appian`.`CF01_Company` `company` on(((`c`.`CompanyId` = `company`.`CompanyId`) and (`company`.`IsActive` = 1)))) 
left join 
    (SELECT group_concat(`a`.`BrandDescription` separator ',
 ') AS `Brands`,
        a.CosmeticFormulationId AS CosmeticFormulationId
    FROM `Appian`.`CF01_Brand` `a`
    WHERE `a`.`IsActive` = 1 GROUP BY a.CosmeticFormulationId) AS Brand
on(((`c`.`CosmeticFormulationId` = `Brand`.`CosmeticFormulationId`)))) 
left join `Appian`.`CF01_Labeler` `b` on(((`b`.`LabelerId` = `c`.`LabelerId`) and (`b`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Address` `d` on(((`d`.`DocumentTypeId` = 3) and (`d`.`ObjectId` = `b`.`LabelerId`) and (`d`.`IsActive` = 1)))) 
left join `Appian`.`CF01_State_R` `e` on((`e`.`StateId` = `d`.`StateId`))) 
left join `Appian`.`CF01_Country_R` `f` on((`f`.`CountryId` = `d`.`CountryId`))) 
left join `Appian`.`CF01_Category_R` `g` on(((`g`.`CategoryId` = `c`.`CategoryId`) and (`g`.`IsActive` = 1)))) 
left join 
    (SELECT group_concat(`h`.`IngredientName` separator ',
 ') AS `Ingredients`,
        h.CosmeticFormulationId AS CosmeticFormulationId
    FROM `Appian`.`CF01_Ingredient_CosmeticFormulation` `h` 
    WHERE `h`.`IsActive` = 1 GROUP BY h.CosmeticFormulationId) AS Ingredient 
on(((`Ingredient`.`CosmeticFormulationId` = `c`.`CosmeticFormulationId`)))) 
left join `Appian`.`CF01_Status_R` `i` on(((`i`.`StatusId` = `c`.`StatusId`) and (`i`.`IsActive` = 1)))) 
where ((`c`.`IsActive` = 1) and (`c`.`StatusId` IN (2,109))
and c.CompanyId = _companyid 
and IFNULL(Brand.Brands,"") LIKE concat('%',_brand,'%') 
and IFNULL(Ingredient.Ingredients,"") LIKE concat('%',_ingredient,'%') 
and IFNULL(b.LabelerName,"") LIKE concat(_labeler,'%')
and IFNULL(g.CategoryDescription,"") LIKE concat(_category,'%') 
and IFNULL(i.StatusDescription,"") LIKE concat(_status,'%') 
and IFNULL(company.CompanyName,"") LIKE concat(_company,'%'))) LIMIT 500;
END CASE$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_REPORT_2512_Manufacturer_Packer_SP`(IN `brand_v` VARCHAR(500), IN `cpis_v` VARCHAR(20), IN `status_v` INT, IN `company_v` VARCHAR(100), IN `manufacturer_registration_number_v` VARCHAR(20), IN `manufacturer_name_v` VARCHAR(100), IN `packer_registration_number_v` VARCHAR(20), IN `packer_name_v` VARCHAR(100), IN `_startIndex` INT)
BEGIN 
   DECLARE query_v TEXT(10000) DEFAULT CONCAT('SELECT   
        CosmeticFormulation.RegistrationNumber AS CPIS,
        Brand.Brands AS Brands,
        Status.StatusDescription AS Status,
        Company.CompanyName AS CompanyName,
        Manufacturer.RegistrationNumber AS ManufacturerRegistrationNumber,
        Manufacturer.StatusDescription AS ManufacturerStatus,
        Manufacturer.EstablishmentName AS ManufacturerName,
        Manufacturer.Address AS ManufacturerAddress,
        CosmeticFormulation.Manufacturer AS Manufacturer,
        CosmeticFormulation.ContractManufacturer AS ContractManufacturer,
        Packer.RegistrationNumber AS PackerRegistrationNumber,
        Packer.StatusDescription AS PackerStatus,
        Packer.EstablishmentName AS PackerName,
        Packer.Address AS PackerAddress,
        CosmeticFormulation.CosmeticFormulationId AS CosmeticFormulationId,
        Manufacturer.CosmeticEstablishmentId AS ManufacturerId,
        Packer.CosmeticEstablishmentId AS PackerId
    FROM
        (SELECT
               cf.CosmeticFormulationId AS CosmeticFormulationId,
               cf.RegistrationNumber AS RegistrationNumber,
               cf.StatusId AS StatusId,
               cf.CompanyId AS CompanyId,
               cf.ManufacturerId AS ManufacturerId,
               cf.PackerId AS PackerId,
               (case when (cf.IsAContractManufacturer = 0) then ',char(39),'Manufacturer',char(39),' else ',char(39),char(39),' end) AS Manufacturer,
               (case when (cf.IsAContractManufacturer = 1) then ',char(39),'Contract Manufacturer',char(39),' else ',char(39),char(39),' end) AS ContractManufacturer
           FROM CF01_CosmeticFormulation cf 
           WHERE cf.IsActive=1
           AND cf.StatusId IN (1,2,3,4,5,103,104,105,106,107,108,109,110)) AS CosmeticFormulation
        LEFT JOIN
           (SELECT
               s.StatusId AS StatusId,
               s.StatusDescription AS StatusDescription
            FROM CF01_Status_R s
            WHERE s.IsActive=1)
            AS Status
        ON CosmeticFormulation.StatusId = Status.StatusId
        LEFT JOIN
           (SELECT
              c.CompanyId AS CompanyId,
              c.CompanyName AS CompanyName
           FROM CF01_Company c
           WHERE c.IsActive=1) 
           AS Company
        ON CosmeticFormulation.CompanyId = Company.CompanyId
        LEFT JOIN
           (SELECT 
               b.BrandDocumentId AS BrandDocumentId,
               b.CosmeticFormulationId AS CosmeticFormulationId,
               GROUP_CONCAT(b.BrandDescription) AS Brands,
               GROUP_CONCAT(b.ProductWebsite) AS Websites
            FROM CF01_Brand b
            WHERE b.IsActive=1 GROUP BY b.CosmeticFormulationId) 
            AS Brand
        ON CosmeticFormulation.CosmeticFormulationId = Brand.CosmeticFormulationId
        LEFT JOIN
           (SELECT 
               ce.CosmeticEstablishmentId AS CosmeticEstablishmentId,
               ce.RegistrationNumber AS RegistrationNumber,
               status.StatusDescription AS StatusDescription,
               ce.EstablishmentName AS EstablishmentName,
               CONCAT_WS("",a.StreetAddress,", ",a.City,", ",state.StateName," ",a.OptionalState," ",c.CountryName) AS Address
            FROM CF01_CosmeticEstablishment ce 
            LEFT JOIN CF01_Address a ON a.IsActive=1 and a.DocumentTypeId=1 and a.ObjectId = ce.CosmeticEstablishmentId
            LEFT JOIN CF01_Country_R c ON c.IsActive=1 and c.CountryId = a.CountryId
            LEFT JOIN CF01_State_R state ON state.IsActive=1 and state.StateId = a.StateId
            LEFT JOIN CF01_Status_R status ON status.IsActive=1 and status.StatusId = ce.StatusId
            WHERE ce.IsActive=1) 
            AS Manufacturer
        ON CosmeticFormulation.ManufacturerId = Manufacturer.CosmeticEstablishmentId
        LEFT JOIN
           (SELECT
              ce.CosmeticEstablishmentId AS CosmeticEstablishmentId,
              ce.RegistrationNumber AS RegistrationNumber,
              status.StatusDescription AS StatusDescription,
              ce.EstablishmentName AS EstablishmentName,
              CONCAT_WS("",a.StreetAddress,", ",a.City,", ",state.StateName," ",a.OptionalState," ",c.CountryName) AS Address
            FROM CF01_CosmeticEstablishment ce 
            LEFT JOIN CF01_Address a ON a.IsActive=1 and a.DocumentTypeId=1 and a.ObjectId = ce.CosmeticEstablishmentId
            LEFT JOIN CF01_Country_R c ON c.IsActive=1 and c.CountryId = a.CountryId
            LEFT JOIN CF01_State_R state ON state.IsActive=1 and state.StateId = a.StateId
            LEFT JOIN CF01_Status_R status ON status.IsActive=1 and status.StatusId = ce.StatusId
            WHERE ce.IsActive=1) 
            AS Packer
        ON CosmeticFormulation.PackerId = Packer.CosmeticEstablishmentId');
   DECLARE first_condition INT(1) DEFAULT TRUE;  
   DECLARE cpis_string TEXT(100) DEFAULT CONCAT('CosmeticFormulation.RegistrationNumber like(',CHAR(39));
   DECLARE brand_string TEXT(100) DEFAULT CONCAT('Brand.Brands LIKE ',CHAR(39),'%');
   DECLARE status_int TEXT(20) DEFAULT 'Status.StatusId = ';
   DECLARE company_string TEXT(100) DEFAULT CONCAT('MATCH(Company.CompanyName) AGAINST(',CHAR(39));
   DECLARE manufacturerRegistrationNumber_string TEXT(100) DEFAULT CONCAT('Manufacturer.RegistrationNumber like(',CHAR(39));
   DECLARE manufacturerName_string TEXT(100) DEFAULT CONCAT('MATCH(Manufacturer.EstablishmentName) AGAINST(',CHAR(39));
   DECLARE packerRegistrationNumber_string TEXT(100) DEFAULT CONCAT('Packer.RegistrationNumber like(',CHAR(39));
   DECLARE packerName_string TEXT(100) DEFAULT CONCAT('MATCH(Packer.EstablishmentName) AGAINST(',CHAR(39));
   DECLARE brand_string_2nd_part TEXT(100) DEFAULT CONCAT('%',CHAR(39));
   DECLARE fulltext_string_2nd_part TEXT(75) DEFAULT CONCAT('*',CHAR(39),' IN BOOLEAN MODE)');
   DECLARE index_string_2nd_part TEXT(75) DEFAULT CONCAT('%',CHAR(39),')');
   IF LENGTH(cpis_v) > 3 THEN
      SET first_condition = FALSE;
      SET query_v = CONCAT(query_v,' WHERE ',cpis_string,cpis_v,index_string_2nd_part);
   END IF;
   IF LENGTH(brand_v) > 3 THEN
      IF first_condition THEN
         SET first_condition = FALSE;
         SET query_v = CONCAT(query_v,' WHERE ',brand_string,brand_v,brand_string_2nd_part);
      ELSE
         SET query_v = CONCAT(query_v,' AND ',brand_string,brand_v,brand_string_2nd_part);
      END IF;
   END IF;
   IF status_v > 0 THEN
      IF first_condition THEN
         SET first_condition = FALSE;
         SET query_v = CONCAT(query_v,' WHERE ',status_int,status_v);
      ELSE
         SET query_v = CONCAT(query_v,' AND ',status_int,status_v);
      END IF;
   END IF;
   IF LENGTH(company_v) > 3 THEN
      IF first_condition THEN
         SET first_condition = FALSE;
         SET query_v = CONCAT(query_v,' WHERE ',company_string,company_v,fulltext_string_2nd_part);
      ELSE
         SET query_v = CONCAT(query_v,' AND ',company_string,company_v,fulltext_string_2nd_part);
      END IF;
   END IF;   
   IF LENGTH(manufacturer_registration_number_v) > 3 THEN
      IF first_condition THEN
         SET first_condition = FALSE;
         SET query_v = CONCAT(query_v,' WHERE ',manufacturerRegistrationNumber_string,manufacturer_registration_number_v,index_string_2nd_part);
      ELSE
         SET query_v = CONCAT(query_v,' AND ',manufacturerRegistrationNumber_string,manufacturer_registration_number_v,index_string_2nd_part);
      END IF;
   END IF;
   IF LENGTH(manufacturer_name_v) >3 THEN
      IF first_condition THEN
         SET first_condition = FALSE;
         SET query_v = CONCAT(query_v,' WHERE ',manufacturerName_string,manufacturer_name_v,fulltext_string_2nd_part);
      ELSE
         SET query_v = CONCAT(query_v,' AND ',manufacturerName_string,manufacturer_name_v,fulltext_string_2nd_part);
      END IF;
   END IF;
   IF LENGTH(packer_registration_number_v) > 3 THEN
      IF first_condition THEN
         SET first_condition = FALSE;
         SET query_v = CONCAT(query_v,' WHERE ',packerRegistrationNumber_string,packer_registration_number_v,index_string_2nd_part);
      ELSE
         SET query_v = CONCAT(query_v,' AND ',packerRegistrationNumber_string,packer_registration_number_v,index_string_2nd_part);
      END IF;
   END IF;
   IF LENGTH(packer_name_v) > 3 THEN
      IF first_condition THEN
         SET first_condition = FALSE;
         SET query_v = CONCAT(query_v,' WHERE ',packerName_string,packer_name_v,fulltext_string_2nd_part);
      ELSE
         SET query_v = CONCAT(query_v,' AND ',packerName_string,packer_name_v,fulltext_string_2nd_part);
      END IF;
   END IF;
   IF NOT first_condition THEN
      
      SET query_v = CONCAT(query_v,' LIMIT ',_startIndex,',20;');
      SET @DynamicSQL = query_v;
      PREPARE stmt FROM @DynamicSQL;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;
   END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_REPORT_FOU_By_IngredientId_SP`(IN `_id` TEXT, IN `_idx` TEXT, IN `_cat` TEXT, IN `_beginDate` TEXT, IN `_endDate` TEXT)
    NO SQL
SELECT
    icf.OriginalCAS AS IngredientCAS,
    icf.IngredientName AS IngredientName,
    cat.CategoryCode,
    cat.CategoryDescription,
    COUNT(icf.CosmeticFormulationId) AS FormulationCount,
    SUM(brand.countBrandPerFormulation) AS BrandCount
FROM (SELECT include.*
    FROM (SELECT
            CosmeticFormulationId,
            IngredientId,
            OriginalCAS,
            IngredientName
        FROM CF01_Ingredient_CosmeticFormulation
        WHERE CosmeticFormulationId IS NOT NULL AND OriginalCAS IS NOT NULL AND IngredientName IS NOT NULL
            AND CASE WHEN _id IS NOT NULL AND _id != '' THEN FIND_IN_SET(IngredientId, _id) ELSE TRUE END) AS include
        LEFT JOIN (SELECT
            CosmeticFormulationId,
            IngredientId
        FROM CF01_Ingredient_CosmeticFormulation
        WHERE CosmeticFormulationId IS NOT NULL
            AND FIND_IN_SET(IngredientId, IFNULL(_idx,'-1'))) AS exclude
        ON include.CosmeticFormulationId = exclude.CosmeticFormulationId
    WHERE exclude.CosmeticFormulationId IS NULL) AS icf
    RIGHT JOIN (SELECT
        CosmeticFormulationId,
        CategoryId,
        RegisteredDate
    FROM CF01_CosmeticFormulation
    WHERE CosmeticFormulationId IS NOT NULL AND CategoryId IS NOT NULL AND RegistrationNumber IS NOT NULL AND IsActive IS TRUE
        AND CASE WHEN _cat IS NOT NULL AND _cat != '' THEN FIND_IN_SET(CategoryId, _cat) ELSE TRUE END
        AND RegisteredDate BETWEEN 
            CASE WHEN _beginDate IS NOT NULL AND _beginDate != '' THEN _beginDate ELSE '1000-01-01 00:00:00' END
            AND CASE WHEN _endDate IS NOT NULL AND _endDate != '' THEN _endDate ELSE '9999-12-31 23:59:59' END) AS cf
    ON icf.CosmeticFormulationId = cf.CosmeticFormulationId
    LEFT JOIN (SELECT
        CategoryId,
        CategoryCode,
        CategoryDescription
    FROM CF01_Category_R) AS cat
    ON cf.CategoryId = cat.CategoryId
    LEFT JOIN (SELECT
        CosmeticFormulationId,
        COUNT(BrandDocumentId) AS countBrandPerFormulation
    FROM CF01_Brand
    WHERE BrandDocumentId IS NOT NULL AND CosmeticFormulationId IS NOT NULL
    GROUP BY CosmeticFormulationId) AS brand
    ON icf.CosmeticFormulationId = brand.CosmeticFormulationId
WHERE icf.OriginalCAS IS NOT NULL
    AND icf.IngredientName IS NOT NULL
    AND cat.CategoryCode IS NOT NULL
    AND cat.CategoryDescription IS NOT NULL
GROUP BY icf.IngredientName,
    cat.CategoryDescription$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_REPORT_SUM_2512_By_Id_SP`(IN `_CosmeticFormulationId` INT)
    NO SQL
select `c`.`CompanyId` AS `CompanyId`,
`company`.`CompanyName` AS `CompanyName`,
`company`.`UserName` AS `Username`,
`c`.`CosmeticFormulationId` AS `CosmeticFormulationId`,
`c`.`RegistrationNumber` AS `RegistrationNumber`,
`c`.`LabelerId` AS `LabelerId`,
`b`.`LabelerNumber` AS `LabelerNumber`,
`b`.`LabelerName` AS `LabelerName`,
`c`.`LabelerType` AS `LabelerType`,
(case when (`c`.`LabelerType` like '%MANUFACTURER%') then 'Manufacturer' else '' end) AS `Manufacturer`,
(case when (`c`.`LabelerType` like '%PACKER%') then 'Packer' else '' end) AS `Packer`,
(case when (`c`.`LabelerType` like '%DISTRIBUTOR%') then 'Distributor' else '' end) AS `Distributor`,
`d`.`StreetAddress` AS `StreetAddress`,
`d`.`City` AS `City`,
(case when isnull(`e`.`StateName`) then `d`.`OptionalState` else `e`.`StateName` end) AS `StateName`,
`d`.`PostalCode` AS `PostalCode`,
`f`.`CountryName` AS `CountryName`,
`g`.`CategoryCode` AS `CategoryCode`,
`g`.`CategoryDescription` AS `CategoryDescription`,
`i`.`StatusDescription` AS `StatusDescription`,
`c`.`RegisteredDate` AS `FiledDate`,
`c`.`AmendedDate` AS `AmendedDate`,
c.StatusId AS StatusId,
c.AuthorizedIndividualId AS AuthorizedIndividualId,
c.FilerType AS FilerType,
Brand.Brands AS `Brands`,
Ingredient.Ingredients AS `Ingredients` 
from (((((((((`Appian`.`CF01_CosmeticFormulation` `c` 
left join `Appian`.`CF01_Company` `company` on(((`c`.`CompanyId` = `company`.`CompanyId`) and (`company`.`IsActive` = 1)))) 
left join 
    (SELECT group_concat(`a`.`BrandDescription` separator ',
 ') AS `Brands`,
        a.CosmeticFormulationId AS CosmeticFormulationId
    FROM `Appian`.`CF01_Brand` `a`
    WHERE `a`.`IsActive` = 1 GROUP BY a.CosmeticFormulationId) AS Brand
on(((`c`.`CosmeticFormulationId` = `Brand`.`CosmeticFormulationId`)))) 
left join `Appian`.`CF01_Labeler` `b` on(((`b`.`LabelerId` = `c`.`LabelerId`) and (`b`.`IsActive` = 1)))) 
left join `Appian`.`CF01_Address` `d` on(((`d`.`DocumentTypeId` = 3) and (`d`.`ObjectId` = `b`.`LabelerId`) and (`d`.`IsActive` = 1)))) 
left join `Appian`.`CF01_State_R` `e` on((`e`.`StateId` = `d`.`StateId`))) 
left join `Appian`.`CF01_Country_R` `f` on((`f`.`CountryId` = `d`.`CountryId`))) 
left join `Appian`.`CF01_Category_R` `g` on(((`g`.`CategoryId` = `c`.`CategoryId`) and (`g`.`IsActive` = 1)))) 
left join 
    (SELECT group_concat(`h`.`IngredientName` separator ',
 ') AS `Ingredients`,
        h.CosmeticFormulationId AS CosmeticFormulationId
    FROM `Appian`.`CF01_Ingredient_CosmeticFormulation` `h` 
    WHERE `h`.`IsActive` = 1 GROUP BY h.CosmeticFormulationId) AS Ingredient 
on(((`Ingredient`.`CosmeticFormulationId` = `c`.`CosmeticFormulationId`)))) 
left join `Appian`.`CF01_Status_R` `i` on(((`i`.`StatusId` = `c`.`StatusId`) and (`i`.`IsActive` = 1)))) 
where ((`c`.`IsActive` = 1) and (`c`.`StatusId` <> 100)
and `c`.`CosmeticFormulationId` = _CosmeticFormulationId)$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CF01_REPORT_Unused_Ingredient_SP`(IN `_name` TEXT, IN `_cas` TEXT, IN `_hidden` TEXT)
    NO SQL
SELECT  * FROM CF01_Unused_Ingredient_VW
WHERE `IngredientName` LIKE CONCAT('%', _name, '%') AND `CalcCAS` LIKE CONCAT('%', _cas, '%') AND `IsHidden` = _hidden
ORDER BY LENGTH(`IngredientName`)$$
DELIMITER ;
