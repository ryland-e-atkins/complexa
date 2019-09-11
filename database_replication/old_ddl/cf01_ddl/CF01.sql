DROP DATABASE CF01_TEST;
CREATE DATABASE CF01_TEST;
USE CF01_TEST;

CREATE TABLE CF01_Address (
  AddressId int(11) NOT NULL,
  StateId int(11) DEFAULT NULL,
  CountryId int(11) DEFAULT NULL,
  DocumentTypeId int(11) NOT NULL,
  ObjectId int(11) NOT NULL,
  StreetAddress varchar(100) NOT NULL,
  City varchar(100) NOT NULL,
  PostalCode varchar(15) DEFAULT NULL,
  OptionalState varchar(100) DEFAULT NULL,
  IsPrimary tinyint(1) DEFAULT '1',
  CreatedOn datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CreatedBy varchar(100) NOT NULL DEFAULT 'Admin',
  ModifiedOn datetime DEFAULT CURRENT_TIMESTAMP,
  ModifiedBy varchar(100) DEFAULT 'Admin',
  IsActive tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_AUDIT_SUM_2511 (
  Id int(11) NOT NULL,
  CosmeticEstablishmentId int(11) DEFAULT NULL,
  EstablishmentType varchar(100) DEFAULT NULL,
  Manufacturer varchar(12) DEFAULT NULL,
  Packer varchar(6) DEFAULT NULL,
  Distributor varchar(11) DEFAULT NULL,
  Retailer varchar(8) DEFAULT NULL,
  BusinessOffice varchar(15) DEFAULT NULL,
  RegistrationNumber varchar(20) DEFAULT NULL,
  EstablishmentName varchar(100) DEFAULT NULL,
  ParentCompany varchar(100) DEFAULT NULL,
  IsAddressManufacturingOrPacking varchar(3) DEFAULT NULL,
  IsOwnerOperator varchar(3) DEFAULT NULL,
  StreetAddress varchar(100) DEFAULT NULL,
  City varchar(100) DEFAULT NULL,
  PostalCode varchar(15) DEFAULT NULL,
  StateName varchar(100) DEFAULT NULL,
  CountryName varchar(50) DEFAULT NULL,
  Tradings text,
  AuthorizedIndividualFirstName varchar(100) DEFAULT NULL,
  AuthorizedIndividualLastName varchar(100) DEFAULT NULL,
  AuthorizedIndividualTitle varchar(100) DEFAULT NULL,
  AuthorizedIndividualEmail varchar(100) DEFAULT NULL,
  AuthorizedIndividualPhone varchar(15) DEFAULT NULL,
  AlternativeAuthorizedIndividualFirstName varchar(100) DEFAULT NULL,
  AlternativeAuthorizedIndividualLastName varchar(100) DEFAULT NULL,
  AlternativeAuthorizedIndividualTitle varchar(100) DEFAULT NULL,
  AlternativeAuthorizedIndividualEmail varchar(100) DEFAULT NULL,
  AlternativeAuthorizedIndividualPhone varchar(15) DEFAULT NULL,
  StatusId int(11) DEFAULT NULL,
  StatusDescription varchar(75) DEFAULT NULL,
  RegisteredDate date DEFAULT NULL,
  VerifiedDate date DEFAULT NULL,
  DiscontinuedDate date DEFAULT NULL,
  AmendedDate date DEFAULT NULL,
  ApprovedDate date DEFAULT NULL,
  ApprovedBy varchar(100) DEFAULT NULL,
  RejectedDate date DEFAULT NULL,
  ProcessedDate date DEFAULT NULL,
  IsPaperFiling tinyint(1) DEFAULT NULL,
  CompanyName varchar(101) DEFAULT NULL,
  CreatedOn date DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_AUDIT_SUM_2512 (
  Id int(11) NOT NULL,
  CosmeticFormulationId int(11) DEFAULT NULL,
  StatusId int(11) DEFAULT NULL,
  StatusDescription varchar(75) DEFAULT NULL,
  RegistrationNumber varchar(20) DEFAULT NULL,
  LabelerName varchar(100) DEFAULT NULL,
  LabelerType varchar(100) DEFAULT NULL,
  LabelerStreetAddress varchar(100) DEFAULT NULL,
  LabelerCity varchar(100) DEFAULT NULL,
  LabelerStateName varchar(100) DEFAULT NULL,
  LabelerPostalCode varchar(15) DEFAULT NULL,
  LabelerCountryName varchar(50) DEFAULT NULL,
  ManufacturerName varchar(100) DEFAULT NULL,
  IsAContractManufacturer tinyint(1) DEFAULT NULL,
  ManufacturerRegistrationNumber varchar(20) DEFAULT NULL,
  ManufacturerStreetAddress varchar(100) DEFAULT NULL,
  ManufacturerCity varchar(100) DEFAULT NULL,
  ManufacturerStateName varchar(100) DEFAULT NULL,
  ManufacturerPostalCode varchar(15) DEFAULT NULL,
  ManufacturerCountryName varchar(50) DEFAULT NULL,
  PackerName varchar(100) DEFAULT NULL,
  PackerRegistrationNumber varchar(20) DEFAULT NULL,
  PackerStreetAddress varchar(100) DEFAULT NULL,
  PackerCity varchar(100) DEFAULT NULL,
  PackerStateName varchar(100) DEFAULT NULL,
  PackerPostalCode varchar(15) DEFAULT NULL,
  PackerCountryName varchar(50) DEFAULT NULL,
  IsCommerciallyDistributed tinyint(1) DEFAULT NULL,
  CategoryCode varchar(100) DEFAULT NULL,
  CategoryDescription varchar(500) DEFAULT NULL,
  FilerType varchar(100) DEFAULT NULL,
  AuthorizedIndividualFirstName varchar(100) DEFAULT NULL,
  AuthorizedIndividualLastName varchar(100) DEFAULT NULL,
  AuthorizedIndividualTitle varchar(100) DEFAULT NULL,
  AuthorizedIndividualEmail varchar(100) DEFAULT NULL,
  AuthorizedIndividualPhone varchar(15) DEFAULT NULL,
  AlternativeAuthorizedIndividualFirstName varchar(100) DEFAULT NULL,
  AlternativeAuthorizedIndividualLastName varchar(100) DEFAULT NULL,
  AlternativeAuthorizedIndividualTitle varchar(100) DEFAULT NULL,
  AlternativeAuthorizedIndividualEmail varchar(100) DEFAULT NULL,
  AlternativeAuthorizedIndividualPhone varchar(15) DEFAULT NULL,
  Brands text,
  Ingredients text,
  RegisteredDate datetime DEFAULT NULL,
  VerifiedDate datetime DEFAULT NULL,
  DiscontinuedDate datetime DEFAULT NULL,
  AmendedDate datetime DEFAULT NULL,
  ApprovedDate datetime DEFAULT NULL,
  ApprovedBy varchar(100) DEFAULT NULL,
  ProcessedDate datetime DEFAULT NULL,
  RejectedDate datetime DEFAULT NULL,
  IsPaperFiling tinyint(1) DEFAULT NULL,
  AccountName varchar(101) DEFAULT NULL,
  IsFDACosmetic char(1) DEFAULT NULL,
  LabelElement varchar(25) DEFAULT NULL,
  LabelClaim varchar(25) DEFAULT NULL,
  IngredientIssue varchar(25) DEFAULT NULL,
  Other varchar(75) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_Brand (
  BrandDocumentId int(11) NOT NULL,
  CosmeticFormulationId int(11) NOT NULL,
  FolderId int(11) DEFAULT NULL,
  BrandDescription varchar(500) DEFAULT NULL,
  ProductWebSite varchar(500) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL,
  IsQueried tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_CASAutoGenerate (
  Id int(11) NOT NULL,
  CAS decimal(30,0) NOT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_CategoryType_R (
  CategoryTypeId int(11) NOT NULL,
  CategoryTypeDescription varchar(500) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_Category_R (
  CategoryId int(11) NOT NULL,
  CategoryTypeId int(11) DEFAULT NULL,
  CategoryCode varchar(100) DEFAULT NULL,
  CategoryDescription varchar(500) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_Company (
  CompanyId int(11) NOT NULL,
  CompanyName varchar(100) NOT NULL,
  FirstName varchar(50) DEFAULT NULL,
  LastName varchar(50) DEFAULT NULL,
  JobTitle varchar(100) DEFAULT NULL,
  Region varchar(50) DEFAULT NULL,
  Country varchar(50) DEFAULT NULL,
  UserName varchar(255) DEFAULT NULL,
  Phone varchar(15) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  AlternateEmail varchar(50) DEFAULT NULL,
  Status int(11) DEFAULT NULL,
  Fax varchar(15) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_CosmeticEstablishment (
  CosmeticEstablishmentId int(11) NOT NULL,
  CompanyId int(11) NOT NULL,
  StatusId int(11) NOT NULL,
  AuthorizedIndividualId int(11) DEFAULT NULL,
  AlternativeAuthorizedIndividualId int(11) DEFAULT NULL,
  EstablishmentType varchar(100) DEFAULT NULL,
  RegistrationNumber varchar(20) DEFAULT NULL,
  ParentCompany varchar(100) DEFAULT NULL,
  EstablishmentName varchar(100) NOT NULL,
  IsOwnerOperator tinyint(1) DEFAULT NULL,
  IsTheAddressManufacturingOrPacking tinyint(1) DEFAULT NULL,
  AuthorizedIndividualDate datetime DEFAULT NULL,
  AlternativeAuthorizedIndividualDate datetime DEFAULT NULL,
  RegisteredDate datetime DEFAULT NULL,
  ApprovedDate datetime DEFAULT NULL,
  ApprovedBy varchar(100) DEFAULT NULL,
  AmendedDate datetime DEFAULT NULL,
  VerifiedDate datetime DEFAULT NULL,
  DiscontinuedDate datetime DEFAULT NULL,
  ProcessedDate datetime DEFAULT NULL,
  RejectedDate datetime DEFAULT NULL,
  IsOnHold varchar(100) DEFAULT NULL,
  IsPaperFiling tinyint(1) DEFAULT '0',
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_CosmeticFormulation (
  CosmeticFormulationId int(11) NOT NULL,
  CategoryId int(11) DEFAULT NULL,
  CompanyId int(11) NOT NULL,
  LabelerId int(11) DEFAULT NULL,
  ManufacturerId int(11) DEFAULT NULL,
  PackerId int(11) DEFAULT NULL,
  StatusId int(11) NOT NULL,
  FolderId int(11) DEFAULT NULL,
  AuthorizedIndividualId int(11) DEFAULT NULL,
  AlternativeAuthorizedIndividualId int(11) DEFAULT NULL,
  RegistrationNumber varchar(20) DEFAULT NULL,
  IsAContractManufacturer tinyint(1) DEFAULT NULL,
  IsCommerciallyDistributed tinyint(1) DEFAULT NULL,
  LabelerType varchar(100) DEFAULT NULL,
  FilerType varchar(100) DEFAULT NULL,
  RegisteredDate datetime DEFAULT NULL,
  ApprovedDate datetime DEFAULT NULL,
  ApprovedBy varchar(100) DEFAULT NULL,
  AmendedDate datetime DEFAULT NULL,
  VerifiedDate datetime DEFAULT NULL,
  DiscontinuedDate datetime DEFAULT NULL,
  ProcessedDate datetime DEFAULT NULL,
  RejectedDate datetime DEFAULT NULL,
  AuthorizedIndividualDate datetime DEFAULT NULL,
  AlternativeAuthorizedIndividualDate datetime DEFAULT NULL,
  IsOnHold varchar(100) DEFAULT NULL,
  IsPaperFiling tinyint(1) DEFAULT '0',
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL,
  NanoIdPrivate varchar(6) DEFAULT NULL,
  ShowLegacyLabelerData tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_Country_R (
  CountryId int(11) NOT NULL,
  CountryCode varchar(2) NOT NULL,
  CountryName varchar(50) NOT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_DocumentType_R (
  DocumentTypeId int(11) NOT NULL,
  DocumentTypeDescription varchar(75) NOT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_EmailTemplate_A (
  id int(11) NOT NULL,
  title text,
  html_1 text,
  html_2 text,
  html_3 text,
  html_4 text,
  fileName varchar(255) NOT NULL,
  isactive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_EstablishmentType_R (
  EstablishmentTypeId int(11) NOT NULL,
  EstablishmentTypeDescription varchar(75) NOT NULL,
  IsMainEstablishment tinyint(1) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_Filer (
  FilerId int(11) NOT NULL,
  CompanyId int(11) NOT NULL,
  FirstName varchar(100) DEFAULT NULL,
  LastName varchar(100) DEFAULT NULL,
  Title varchar(100) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  Phone varchar(100) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL,
  PrimaryFiler tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_FilerType_R (
  FilerTypeId int(11) NOT NULL,
  FilerTypeDescription varchar(30) NOT NULL,
  CreatedOn datetime NOT NULL,
  CreatedBy varchar(100) NOT NULL,
  ModifiedOn datetime NOT NULL,
  ModifiedBy varchar(100) NOT NULL,
  IsActive tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_IngredientIssue_R (
  IngredientIssueId int(11) NOT NULL,
  IngredientIssueDescription varchar(75) NOT NULL,
  IngredientIssueOrder int(11) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_Ingredient_CosmeticFormulation (
  Id int(11) NOT NULL,
  Position int(11) DEFAULT NULL,
  CompanyId int(11) DEFAULT NULL,
  IngredientId int(15) DEFAULT NULL,
  CosmeticFormulationId int(11) DEFAULT NULL,
  DisplayCAS varchar(50) DEFAULT NULL,
  OriginalCAS varchar(50) DEFAULT NULL,
  CalcCAS varchar(50) DEFAULT NULL,
  IngredientName varchar(500) DEFAULT NULL,
  PrimaryName varchar(500) DEFAULT NULL,
  PrimaryId int(15) DEFAULT NULL,
  IsHidden tinyint(1) DEFAULT NULL,
  Status int(11) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_Ingredient_R (
  IngredientId int(15) NOT NULL,
  DisplayCAS varchar(50) DEFAULT NULL,
  OriginalCAS varchar(50) DEFAULT NULL,
  CalcCAS varchar(50) DEFAULT NULL,
  TypeId int(11) DEFAULT NULL,
  IngredientName varchar(500) NOT NULL,
  IsHidden tinyint(1) DEFAULT NULL,
  Status int(11) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_Ingredient_Synonym_R (
  SynonymId int(11) NOT NULL,
  IngredientId int(15) NOT NULL,
  DisplayCAS varchar(50) DEFAULT NULL,
  OriginalCAS varchar(50) DEFAULT NULL,
  CalcCAS varchar(50) DEFAULT NULL,
  TypeId int(11) DEFAULT NULL,
  IngredientName varchar(500) DEFAULT NULL,
  IsHidden tinyint(1) DEFAULT NULL,
  Status int(11) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL,
  IsSynonym int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_LabelClaim_R (
  LabelClaimId int(11) NOT NULL,
  LabelClaimDescription varchar(75) NOT NULL,
  LabelClaimOrder int(11) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_LabelElement_R (
  LabelElementId int(11) NOT NULL,
  LabelElementDescription varchar(75) NOT NULL,
  LabelElementOrder int(11) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_Labeler (
  LabelerId int(11) NOT NULL,
  CompanyId int(11) NOT NULL,
  StatusId int(11) NOT NULL,
  LabelerNumber int(11) DEFAULT NULL,
  LabelerName varchar(100) NOT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_LabelerBusinessType_R (
  LabelerBusinessTypeId int(11) NOT NULL,
  LabelerBusinessTypeDescription varchar(75) NOT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_Labeler_Merge (
  Id int(11) NOT NULL,
  LabelerId int(11) NOT NULL,
  CompanyId int(11) NOT NULL,
  IsActive tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_Memo (
  MemoId int(11) NOT NULL,
  DocumentTypeId int(11) NOT NULL,
  ObjectId int(11) NOT NULL,
  Memo varchar(2000) NOT NULL,
  IsInternal tinyint(1) DEFAULT NULL,
  IsFromInternal tinyint(1) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_Orphaned_CasTempCas (
  TEMPCASID int(5) NOT NULL,
  CODE varchar(11) DEFAULT NULL,
  CPISID int(7) DEFAULT NULL,
  NAME varchar(115) DEFAULT NULL,
  CTFA_ID varchar(10) DEFAULT NULL,
  ING_TYPE varchar(10) DEFAULT NULL,
  HIDDEN varchar(10) DEFAULT NULL,
  MARK varchar(10) DEFAULT NULL,
  DATESTAMP varchar(9) DEFAULT NULL,
  INGNUM int(2) DEFAULT NULL,
  MODIFY_ACCOUNTID varchar(7) DEFAULT NULL,
  MODIFY_PERSONID varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_RegistrationNumber_Reserved (
  Id int(11) NOT NULL,
  FormType varchar(100) DEFAULT NULL,
  FormId int(11) DEFAULT NULL,
  Number varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_ResearchQuestion (
  ResearchQuestionId int(11) NOT NULL,
  CosmeticFormulationId int(11) NOT NULL,
  IsFDACosmetic char(1) DEFAULT NULL,
  LabelElement varchar(25) DEFAULT NULL,
  LabelClaim varchar(25) DEFAULT NULL,
  IngredientIssue varchar(25) DEFAULT NULL,
  Other varchar(75) DEFAULT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_State_R (
  StateId int(11) NOT NULL,
  CountryId int(11) NOT NULL,
  StateCode varchar(2) NOT NULL,
  StateName varchar(50) NOT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_Status_R (
  StatusId int(11) NOT NULL,
  StatusDescription varchar(75) NOT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_SystemMessage (
  id int(11) NOT NULL,
  message varchar(5000) DEFAULT NULL,
  startdate datetime DEFAULT NULL,
  enddate datetime DEFAULT NULL,
  isactive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_Trading (
  TradingId int(11) NOT NULL,
  CosmeticEstablishmentId int(11) NOT NULL,
  TradingName varchar(100) NOT NULL,
  CreatedOn datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedOn datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  IsActive tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_UserLock (
  Id int(11) NOT NULL,
  Username varchar(100) DEFAULT NULL,
  IsInternal tinyint(1) DEFAULT NULL,
  UIType varchar(25) DEFAULT NULL,
  FormId int(11) DEFAULT NULL,
  StartTime datetime DEFAULT NULL,
  EndTime datetime DEFAULT NULL,
  IsActive tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CF01_UserLoginLog (
  Id int(11) NOT NULL,
  CompanyId int(11) NOT NULL,
  LastActivityDate date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE CF01_Address
  ADD PRIMARY KEY (AddressId),
  ADD KEY CA_StateId_FK (StateId),
  ADD KEY CA_CountryId_FK (CountryId),
  ADD KEY CA_DocumentTypeId_FK (DocumentTypeId);

ALTER TABLE CF01_AUDIT_SUM_2511
  ADD PRIMARY KEY (Id),
  ADD KEY CAS2511_CosmteticEstablishmentId_FK (CosmeticEstablishmentId);

ALTER TABLE CF01_AUDIT_SUM_2512
  ADD PRIMARY KEY (Id),
  ADD KEY CAS2512_CosmteticFormulationId_FK (CosmeticFormulationId),
  ADD KEY CAS2512_StatusId_FK (StatusId);

ALTER TABLE CF01_Brand
  ADD PRIMARY KEY (BrandDocumentId),
  ADD KEY CB_CosmeticFormulationId_FK (CosmeticFormulationId);
ALTER TABLE CF01_Brand ADD FULLTEXT KEY CB_BrandDescription_FTIDX (BrandDescription);

ALTER TABLE CF01_CASAutoGenerate
  ADD PRIMARY KEY (Id);

ALTER TABLE CF01_CategoryType_R
  ADD PRIMARY KEY (CategoryTypeId);

ALTER TABLE CF01_Category_R
  ADD PRIMARY KEY (CategoryId),
  ADD KEY CCR_CategoryTypeId_FK (CategoryTypeId);

ALTER TABLE CF01_Company
  ADD PRIMARY KEY (CompanyId),
  ADD UNIQUE KEY CF01_Company_UK (UserName) USING BTREE;
ALTER TABLE CF01_Company ADD FULLTEXT KEY CC_CompanyName_FTIDX (CompanyName);

ALTER TABLE CF01_CosmeticEstablishment
  ADD PRIMARY KEY (CosmeticEstablishmentId),
  ADD KEY CCE_RegistrationNumber_IDX (RegistrationNumber) USING BTREE;
ALTER TABLE CF01_CosmeticEstablishment ADD FULLTEXT KEY CCE_EstablishmentName_FTIDX (EstablishmentName);

ALTER TABLE CF01_CosmeticFormulation
  ADD PRIMARY KEY (CosmeticFormulationId),
  ADD KEY CCF_RegistrationNumber_IDX (RegistrationNumber) USING BTREE,
  ADD KEY CCF_LabelerId_IDX (LabelerId) USING BTREE,
  ADD KEY CCF_CategoryId_FK (CategoryId),
  ADD KEY CCF_CompanyId_FK (CompanyId);

ALTER TABLE CF01_Country_R
  ADD PRIMARY KEY (CountryId);

ALTER TABLE CF01_DocumentType_R
  ADD PRIMARY KEY (DocumentTypeId);

ALTER TABLE CF01_EmailTemplate_A
  ADD PRIMARY KEY (id);

ALTER TABLE CF01_EstablishmentType_R
  ADD PRIMARY KEY (EstablishmentTypeId);

ALTER TABLE CF01_Filer
  ADD PRIMARY KEY (FilerId),
  ADD KEY CF_CompanyId_FK (CompanyId);

ALTER TABLE CF01_FilerType_R
  ADD PRIMARY KEY (FilerTypeId);

ALTER TABLE CF01_IngredientIssue_R
  ADD PRIMARY KEY (IngredientIssueId);

ALTER TABLE CF01_Ingredient_CosmeticFormulation
  ADD PRIMARY KEY (Id),
  ADD KEY CICF_IngredientName_IDX (IngredientName) USING BTREE,
  ADD KEY CICF_OriginalCAS_IDX (OriginalCAS) USING BTREE,
  ADD KEY CICF_IngredientId_IDX (IngredientId) USING BTREE,
  ADD KEY CICF_CosmeticFormulationId_FK (CosmeticFormulationId);

ALTER TABLE CF01_Ingredient_R
  ADD PRIMARY KEY (IngredientId),
  ADD UNIQUE KEY CIR_Ingredient_R_UK (IngredientName) USING BTREE,
  ADD UNIQUE KEY CIR_DisplayCAS_UK (DisplayCAS) USING BTREE,
  ADD UNIQUE KEY CIR_OriginalCAS_UK (OriginalCAS) USING BTREE,
  ADD UNIQUE KEY CIR_CalcCAS_UK (CalcCAS) USING BTREE;

ALTER TABLE CF01_Ingredient_Synonym_R
  ADD PRIMARY KEY (SynonymId),
  ADD UNIQUE KEY CF01_Ingredient_Synonym_R_UK (IngredientName) USING BTREE,
  ADD KEY CISR_IngredientId_IDX (IngredientId) USING BTREE,
  ADD KEY CISR_OriginalCAS_IDX (OriginalCAS) USING BTREE;

ALTER TABLE CF01_LabelClaim_R
  ADD PRIMARY KEY (LabelClaimId);

ALTER TABLE CF01_LabelElement_R
  ADD PRIMARY KEY (LabelElementId),
  ADD UNIQUE KEY LabelElementId (LabelElementId);

ALTER TABLE CF01_Labeler
  ADD PRIMARY KEY (LabelerId),
  ADD KEY CL_LabelerNumber_IDX (LabelerNumber) USING BTREE;
ALTER TABLE CF01_Labeler ADD FULLTEXT KEY CL_LabelerName_FTIDX (LabelerName);

ALTER TABLE CF01_LabelerBusinessType_R
  ADD PRIMARY KEY (LabelerBusinessTypeId);

ALTER TABLE CF01_Labeler_Merge
  ADD PRIMARY KEY (Id),
  ADD KEY CLM_LabelerId_FK (LabelerId),
  ADD KEY CLM_CompanyId_FK (CompanyId);

ALTER TABLE CF01_Memo
  ADD PRIMARY KEY (MemoId);

ALTER TABLE CF01_Orphaned_CasTempCas
  ADD PRIMARY KEY (TEMPCASID);

ALTER TABLE CF01_RegistrationNumber_Reserved
  ADD PRIMARY KEY (Id);

ALTER TABLE CF01_ResearchQuestion
  ADD PRIMARY KEY (ResearchQuestionId);

ALTER TABLE CF01_State_R
  ADD PRIMARY KEY (StateId),
  ADD KEY FK_STATE_COUNTRY (CountryId);

ALTER TABLE CF01_Status_R
  ADD PRIMARY KEY (StatusId),
  ADD UNIQUE KEY CF01_Status_R_UK (StatusDescription);

ALTER TABLE CF01_SystemMessage
  ADD PRIMARY KEY (id);

ALTER TABLE CF01_Trading
  ADD PRIMARY KEY (TradingId);

ALTER TABLE CF01_UserLock
  ADD PRIMARY KEY (Id);

ALTER TABLE CF01_UserLoginLog
  ADD PRIMARY KEY (Id),
  ADD KEY CU_CompanyId_FK (CompanyId);

ALTER TABLE CF01_Address
  MODIFY AddressId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_AUDIT_SUM_2511
  MODIFY Id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_AUDIT_SUM_2512
  MODIFY Id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_Brand
  MODIFY BrandDocumentId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_CASAutoGenerate
  MODIFY Id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_CategoryType_R
  MODIFY CategoryTypeId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_Category_R
  MODIFY CategoryId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_Company
  MODIFY CompanyId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_CosmeticEstablishment
  MODIFY CosmeticEstablishmentId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_CosmeticFormulation
  MODIFY CosmeticFormulationId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_Country_R
  MODIFY CountryId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_DocumentType_R
  MODIFY DocumentTypeId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_EmailTemplate_A
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_EstablishmentType_R
  MODIFY EstablishmentTypeId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_Filer
  MODIFY FilerId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_FilerType_R
  MODIFY FilerTypeId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_IngredientIssue_R
  MODIFY IngredientIssueId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_Ingredient_CosmeticFormulation
  MODIFY Id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_Ingredient_R
  MODIFY IngredientId int(15) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_Ingredient_Synonym_R
  MODIFY SynonymId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_LabelClaim_R
  MODIFY LabelClaimId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_LabelElement_R
  MODIFY LabelElementId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_Labeler
  MODIFY LabelerId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_LabelerBusinessType_R
  MODIFY LabelerBusinessTypeId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_Labeler_Merge
  MODIFY Id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_Memo
  MODIFY MemoId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_RegistrationNumber_Reserved
  MODIFY Id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_ResearchQuestion
  MODIFY ResearchQuestionId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_State_R
  MODIFY StateId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_Status_R
  MODIFY StatusId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_SystemMessage
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_Trading
  MODIFY TradingId int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_UserLock
  MODIFY Id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_UserLoginLog
  MODIFY Id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE CF01_Address
  ADD CONSTRAINT CA_CountryId_FK FOREIGN KEY (CountryId) REFERENCES CF01_Country_R (CountryId),
  ADD CONSTRAINT CA_DocumentTypeId_FK FOREIGN KEY (DocumentTypeId) REFERENCES CF01_DocumentType_R (DocumentTypeId),
  ADD CONSTRAINT CA_StateId_FK FOREIGN KEY (StateId) REFERENCES CF01_State_R (StateId);

ALTER TABLE CF01_AUDIT_SUM_2511
  ADD CONSTRAINT CAS2511_CosmteticEstablishmentId_FK FOREIGN KEY (CosmeticEstablishmentId) REFERENCES CF01_CosmeticEstablishment (CosmeticEstablishmentId);

ALTER TABLE CF01_AUDIT_SUM_2512
  ADD CONSTRAINT CAS2512_CosmteticFormulationId_FK FOREIGN KEY (CosmeticFormulationId) REFERENCES CF01_CosmeticFormulation (CosmeticFormulationId),
  ADD CONSTRAINT CAS2512_StatusId_FK FOREIGN KEY (StatusId) REFERENCES CF01_Status_R (StatusId);

ALTER TABLE CF01_Brand
  ADD CONSTRAINT CB_CosmeticFormulationId_FK FOREIGN KEY (CosmeticFormulationId) REFERENCES CF01_CosmeticFormulation (CosmeticFormulationId);

ALTER TABLE CF01_Category_R
  ADD CONSTRAINT CCR_CategoryTypeId_FK FOREIGN KEY (CategoryTypeId) REFERENCES CF01_CategoryType_R (CategoryTypeId);

ALTER TABLE CF01_CosmeticFormulation
  ADD CONSTRAINT CCF_CategoryId_FK FOREIGN KEY (CategoryId) REFERENCES CF01_Category_R (CategoryId),
  ADD CONSTRAINT CCF_CompanyId_FK FOREIGN KEY (CompanyId) REFERENCES CF01_Company (CompanyId),
  ADD CONSTRAINT CCF_LabelerId_FK FOREIGN KEY (LabelerId) REFERENCES CF01_Labeler (LabelerId);

ALTER TABLE CF01_Filer
  ADD CONSTRAINT CF_CompanyId_FK FOREIGN KEY (CompanyId) REFERENCES CF01_Company (CompanyId);

ALTER TABLE CF01_Ingredient_CosmeticFormulation
  ADD CONSTRAINT CICF_CosmeticFormulationId_FK FOREIGN KEY (CosmeticFormulationId) REFERENCES CF01_CosmeticFormulation (CosmeticFormulationId),
  ADD CONSTRAINT CICF_IngredientId_FK FOREIGN KEY (IngredientId) REFERENCES CF01_Ingredient_R (IngredientId);

ALTER TABLE CF01_Labeler_Merge
  ADD CONSTRAINT CLM_CompanyId_FK FOREIGN KEY (CompanyId) REFERENCES CF01_Company (CompanyId),
  ADD CONSTRAINT CLM_LabelerId_FK FOREIGN KEY (LabelerId) REFERENCES CF01_Labeler (LabelerId);

ALTER TABLE CF01_State_R
  ADD CONSTRAINT CSR_CountryId_FK FOREIGN KEY (CountryId) REFERENCES CF01_Country_R (CountryId);

ALTER TABLE CF01_UserLoginLog
  ADD CONSTRAINT CU_CompanyId_FK FOREIGN KEY (CompanyId) REFERENCES CF01_Company (CompanyId);
