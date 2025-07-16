if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface HspAPageTwo_Params {
    pageInfos?: NavPathStack;
}
import Logger from "@bundle:com.samples.systemrouter/hspA/ets/common/utils/Logger";
export function HspAPageTwoBuilder(name: string, param: Object, parent = null) {
    {
        (parent ? parent : this).observeComponentCreation2((elmtId, isInitialRender) => {
            if (isInitialRender) {
                let componentCall = new HspAPageTwo(parent ? parent : this, {}, undefined, elmtId, () => { }, { page: "hspA/src/main/ets/pages/HspAPageTwo.ets", line: 20, col: 3 });
                ViewPU.create(componentCall);
                let paramsLambda = () => {
                    return {};
                };
                componentCall.paramsGenerator_ = paramsLambda;
            }
            else {
                (parent ? parent : this).updateStateVarsOfChildByElmtId(elmtId, {});
            }
        }, { name: "HspAPageTwo" });
    }
}
const COLUMN_SPACE: number = 12;
export class HspAPageTwo extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.pageInfos = new NavPathStack();
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: HspAPageTwo_Params) {
        if (params.pageInfos !== undefined) {
            this.pageInfos = params.pageInfos;
        }
    }
    updateStateVars(params: HspAPageTwo_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
    }
    aboutToBeDeleted() {
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private pageInfos: NavPathStack;
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            NavDestination.create(() => {
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Column.create({ space: COLUMN_SPACE });
                    Column.width({ "id": 67108884, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Column.height({ "id": 67108883, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Column.justifyContent(FlexAlign.End);
                    Column.padding({
                        bottom: { "id": 67108869, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" },
                        left: { "id": 67108869, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" },
                        right: { "id": 67108869, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" }
                    });
                }, Column);
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 67108870, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 67108868, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.height({ "id": 67108866, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.onClick(() => {
                        //Clear all pages in the stack.
                        this.pageInfos.clear();
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 67108872, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 67108868, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.height({ "id": 67108866, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('pageOne', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 67108873, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 67108868, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.height({ "id": 67108866, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('pageTwo', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 67108877, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 67108868, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.height({ "id": 67108866, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HarBPageOne', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 67108878, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 67108868, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.height({ "id": 67108866, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HarBPageTwo', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 67108879, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 67108868, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.height({ "id": 67108866, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HspAPageOne', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 67108881, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 67108868, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.height({ "id": 67108866, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HspBPageOne', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 67108882, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 67108868, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.height({ "id": 67108866, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HspBPageTwo', null);
                    });
                }, Button);
                Button.pop();
                Column.pop();
            }, { moduleName: "hspA", pagePath: "hspA/src/main/ets/pages/HspAPageTwo" });
            NavDestination.title('hspA-pageTwo');
            NavDestination.onReady((context: NavDestinationContext) => {
                this.pageInfos = context.pathStack;
                Logger.info('current page config info is ' + JSON.stringify(context.getConfigInRouteMap()));
            });
        }, NavDestination);
        NavDestination.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
(function () {
    if (typeof NavigationBuilderRegister === "function") {
        NavigationBuilderRegister("HspAPageTwo", wrapBuilder(HspAPageTwoBuilder));
    }
})();
