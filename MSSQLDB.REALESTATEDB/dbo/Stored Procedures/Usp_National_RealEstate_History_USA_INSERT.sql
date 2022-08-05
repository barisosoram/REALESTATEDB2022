
/*
EXECUTE  [dbo].[Usp_National_RealEstate_History_USA_INSERT] 
*/

create proc [dbo].[Usp_National_RealEstate_History_USA_INSERT]
as
BEGIN
BEGIN TRY  
		BEGIN TRANSACTION;

		MERGE INTO [dbo].[National_RealEstate_History_USA] Target
		USING [stage].[National_RealEstate_History_USA] Source
		ON Target.[month_date_yyyymm]=Source.[month_date_yyyymm]
		and Target.country=Source.country

		WHEN NOT MATCHED THEN INSERT
				   (
				   [month_date_yyyymm]
				  ,[country]
				  ,[median_listing_price]
				  ,[median_listing_price_mm]
				  ,[median_listing_price_yy]
				  ,[active_listing_count]
				  ,[active_listing_count_mm]
				  ,[active_listing_count_yy]
				  ,[median_days_on_market]
				  ,[median_days_on_market_mm]
				  ,[median_days_on_market_yy]
				  ,[new_listing_count]
				  ,[new_listing_count_mm]
				  ,[new_listing_count_yy]
				  ,[price_increased_count]
				  ,[price_increased_count_mm]
				  ,[price_increased_count_yy]
				  ,[price_reduced_count]
				  ,[price_reduced_count_mm]
				  ,[price_reduced_count_yy]
				  ,[pending_listing_count]
				  ,[pending_listing_count_mm]
				  ,[pending_listing_count_yy]
				  ,[median_listing_price_per_square_foot]
				  ,[median_listing_price_per_square_foot_mm]
				  ,[median_listing_price_per_square_foot_yy]
				  ,[median_square_feet]
				  ,[median_square_feet_mm]
				  ,[median_square_feet_yy]
				  ,[average_listing_price]
				  ,[average_listing_price_mm]
				  ,[average_listing_price_yy]
				  ,[total_listing_count]
				  ,[total_listing_count_mm]
				  ,[total_listing_count_yy]
				  ,[pending_ratio]
				  ,[pending_ratio_mm]
				  ,[pending_ratio_yy]
				  ,[quality_flag]
				   )
			VALUES(
				   Source.[month_date_yyyymm]
				  ,Source.[country]
				  ,Source.[median_listing_price]
				  ,Source.[median_listing_price_mm]
				  ,Source.[median_listing_price_yy]
				  ,Source.[active_listing_count]
				  ,Source.[active_listing_count_mm]
				  ,Source.[active_listing_count_yy]
				  ,Source.[median_days_on_market]
				  ,Source.[median_days_on_market_mm]
				  ,Source.[median_days_on_market_yy]
				  ,Source.[new_listing_count]
				  ,Source.[new_listing_count_mm]
				  ,Source.[new_listing_count_yy]
				  ,Source.[price_increased_count]
				  ,Source.[price_increased_count_mm]
				  ,Source.[price_increased_count_yy]
				  ,Source.[price_reduced_count]
				  ,Source.[price_reduced_count_mm]
				  ,Source.[price_reduced_count_yy]
				  ,Source.[pending_listing_count]
				  ,Source.[pending_listing_count_mm]
				  ,Source.[pending_listing_count_yy]
				  ,Source.[median_listing_price_per_square_foot]
				  ,Source.[median_listing_price_per_square_foot_mm]
				  ,Source.[median_listing_price_per_square_foot_yy]
				  ,Source.[median_square_feet]
				  ,Source.[median_square_feet_mm]
				  ,Source.[median_square_feet_yy]
				  ,Source.[average_listing_price]
				  ,Source.[average_listing_price_mm]
				  ,Source.[average_listing_price_yy]
				  ,Source.[total_listing_count]
				  ,Source.[total_listing_count_mm]
				  ,Source.[total_listing_count_yy]
				  ,Source.[pending_ratio]
				  ,Source.[pending_ratio_mm]
				  ,Source.[pending_ratio_yy]
				  ,Source.[quality_flag]
			  );
   COMMIT TRANSACTION;
END TRY  
BEGIN CATCH 
	IF @@TRANCOUNT > 0  
		ROLLBACK TRANSACTION; 
	print'Insert failed'		
END CATCH;  
END