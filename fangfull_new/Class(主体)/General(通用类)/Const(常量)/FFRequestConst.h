//
//  FFRequestConst.h
//  fangfull_new
//
//  Created by Lee on 16/7/19.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#ifndef FFRequestConst_h
#define FFRequestConst_h

/*------------------------------网络请求接口---------------------------------------------------*/
/*-------------------接口-------(43个)------------------------*/
FOUNDATION_EXPORT NSString *const kMODULE_LOG_IN;         // 登录
extern NSString *const kMODULE_LOG_OUT;        // 退出登录
extern NSString *const kMODULE_Launch;         // 启动应用
extern NSString *const kMODULE_Add_UserAdvice; //意见反馈
//extern NSString *const kMODULE_Info_Promotion; // 消息界面 推广列表
//extern NSString *const kMODULE_Info_Customer;  // 消息界面 客户列表
extern NSString *const kMODULE_GET_SaleRecord; // 我的业绩
extern NSString *const kMODULE_Get_BrokerMessageList;//消息接口
extern NSString *const kMODULE_Get_BrokerMessageInfo;//消息详情接口

extern NSString *const kMODULE_GET_MyMoney;
extern NSString *const kMODULE_Get_AllItems;
extern NSString *const kMODULE_GroupReserve;
extern NSString *const kMODULE_Add_NewUser;
extern NSString *const kMODULE_Add_NetInBuilding;
extern NSString *const kMODULE_Edit_CustomerKinsfolk;
extern NSString *const kMODULE_Add_CustomerKinsfolk;
extern NSString *const kMODULE_TelCustomerListPage;
extern NSString *const kMODULE_Add_TelCustomer;
extern NSString *const kMODULE_Edit_Phone;
extern NSString *const kMODULE_Edit_CustomerIdnumber;
extern NSString *const kMODULE_Edit_CustomerAddress;
extern NSString *const kMODULE_Add_UserRemark;
extern NSString *const kMODULE_CustomerDetail;
extern NSString *const kMODULE_CustomerList;
extern NSString *const kMODULE_CustomerWarningList;
extern NSString *const kMODULE_SignUp;
extern NSString *const kMODULE_Get_AllGroupBuy;
extern NSString *const kMODULE_Get_AllRegion;
extern NSString *const kMODULE_Get_AllClass;
extern NSString *const kMODULE_Get_Price;
extern NSString *const kMODULE_Get_AllGroupBuy_key;
extern NSString *const kMODULE_Get_NewsClasses;
extern NSString *const kMODULE_NewsList_Class;
extern NSString *const kMODULE_Delete_CustomerKinsfolk;
extern NSString *const kMODULE_Get_Kinsfolk;
extern NSString *const kMODULE_Edit_Password;
extern NSString *const kMODULE_Get_CustomerCount;
extern NSString *const kMODULE_Get_BuildingPictures;
extern NSString *const kMODULE_Reservations;
extern NSString *const kMODULE_Brokeragefirm;
extern NSString *const kMODULE_Reserve;
extern NSString *const kMODULE_LoginReserve;
extern NSString *const kMODULE_CustomerToBuildingList;
extern NSString *const kMODULE_BrokerLocationToDb;
extern NSString *const kMODULE_Get_VerCode;
extern NSString *const kMODULE_BuildingDetail;
extern NSString *const kMODULE_Add_Remark;
extern NSString *const kMODULE_GroupDetail;
extern NSString *const kMODULE_House;

/*-------------------废弃接口-------(1个)------------------------*/

extern NSString *const kMODULE_Add_Arrival;

#endif /* FFRequestConst_h */
