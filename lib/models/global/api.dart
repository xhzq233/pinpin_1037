/// pinpin_1037 - api
/// Created by xhz on 2022/1/18. 

class Api {
  static const head = 'https://pinpin.pivotstudio.cn/api';

  ///welcome 不需要权限
  static const createUser = '/welcome/createUser';
  static const getPinPinData = '/welcome/getCompetitions';
  static const searchByPinPinTitle = '/welcome/searchCompetitions';

  ///manage 需要权限
  static const signIn = '/manage/signin';
  static const sendVerifyCode = '/manage/sendVerifyCode';
  static const activateEmail = '/manage/activation';
  static const getPersonalContact = '/manage/getMyContact';
  static const getPersonalInformation = '/manage/getMyInfor';

  ///change模块
  static const changePasswd = '/manage/change/changePassword';
  static const changeUsername = '/manage/change/changeUsername';
  static const changeAvatar = '/manage/change/changeImage';
  static const changePersonalContact =
      '/manage/change/changeContact';
  static const changePersonalExp =
      '/manage/change/changeInfor';

  ///recruit
  static const createPinPin = '/manage/recruit/createCompetition';
  static const updatePinPin = '/manage/recruit/updateCompetition';
  static const updateRecruitNumber =
      '/manage/recruit/updateCompetitionNum';
  static const deletePinPin = '/manage/recruit/deleteCompetition';

  ///follow
  static const followPinPin = '/manage/follows/createFollow';
  static const unfollowPinPin = '/manage/follows/deleteFollow';

  ///reply
  static const replyPinPin = '/manage/replies/createReply';
  static const getReply = '/manage/replies/getReplies';
  static const deleteReply = '/manage/replies/deleteReply';

  ///thumb up
  static const thumbUp = '/manage/thumbups/createThumbUp';
  static const unThumbUp = '/manage/thumbups/deleteThumbUp';

  ///report 举报
  static const reportPinPin = '/manage/reports/createReport';

  ///notice 通知消息
  static const getNotices = '/manage/notices/getNotice';
  static const hadReadNotice = '/manage/notices/readNotice';

  ///sys_notice
  static const createSystemNotice =
      '/manage/systemNotice/createSystemNotice';
  static const getSystemNotice =
      '/manage/systemNotice/getSystemNotice';
  static const readSystemNotice =
      '/manage/systemNotice/readSystemNotice';

  ///myself
  static const getPersonalPinPin = '/manage/myself/getMypinpin';
  static const getFollows = '/manage/myself/getMyfollow';
}
