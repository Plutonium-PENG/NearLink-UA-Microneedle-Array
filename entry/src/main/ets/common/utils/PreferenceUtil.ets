import { preferences } from '@kit.ArkData';
import { AlertDialogs } from '../../views/common/Dialogs';
import { AppGlobalConfigEnums } from '../enums/CommonEnums'



class PreferencesUtil {
    preferencesMap: Map<string, preferences.Preferences> = new Map()

    async getPreferenceInstance(context: Context, preferenceInstanceName: string) {
        try {
            let pref = await preferences.getPreferences(context, preferenceInstanceName)
            this.preferencesMap.set(preferenceInstanceName, pref)

        }
        catch (e) {
            // TODO
            // throw

        }
    }

    async putPreferenceValue(
        preferenceName: string,
        key: string,
        value: preferences.ValueType
    ) {
        if (!this.preferencesMap.has(preferenceName)) {
            // 未初始化
            return
        }
        else {
            try {
                let pref = this.preferencesMap.get(preferenceName)
                await pref?.put(key, value)
                await pref?.flush()
            }
            catch (e) {
                // TODO
                // throw

            }
        }
    }

    async getPreferenceValue(
        preferenceName: string,
        key: string,
        defaultValue: preferences.ValueType
    ) {
        if (!this.preferencesMap.has(preferenceName)) {
            // 未初始化
            return
        }
        else {
            try {
                let pref = this.preferencesMap.get(preferenceName)
                return await pref?.get(key, defaultValue)
            }
            catch (e) {
                // TODO
                // throw
                return
            }
        }
    }

    async deletePreferenceValue() {

    }

}

const preferencesUtil = new PreferencesUtil()

export default preferencesUtil as PreferencesUtil




























