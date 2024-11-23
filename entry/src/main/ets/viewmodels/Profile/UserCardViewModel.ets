export interface UserType {
    isLogin: boolean,
    userName: string,
    contact?: string,
    membership: number

}

export class UserCardViewModel {
    static getUserInfo(u: UserType = {
        isLogin: false,
        userName: "",
        contact: "",
        membership: 0
    }): UserType {

        //todo u.isLogin = true

        return u
    }
}
