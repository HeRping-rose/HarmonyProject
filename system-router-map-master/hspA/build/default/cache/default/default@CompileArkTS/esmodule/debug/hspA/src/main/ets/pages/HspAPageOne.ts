if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface HspAPageOne_Params {
    pageInfos?: NavPathStack;
}
import Logger from "@bundle:com.samples.systemrouter/hspA/ets/common/utils/Logger";
export function HspAPageOneBuilder(name: string, param: Object, parent = null) {
    {
        (parent ? parent : this).observeComponentCreation2((elmtId, isInitialRender) => {
            if (isInitialRender) {
                let componentCall = new HspAPageOne(parent ? parent : this, {}, undefined, elmtId, () => { }, { page: "hspA/src/main/ets/pages/HspAPageOne.ets", line: 20, col: 3 });
                ViewPU.create(componentCall);
                let paramsLambda = () => {
                    return {};
                };
                componentCall.paramsGenerator_ = paramsLambda;
            }
            else {
                (parent ? parent : this).updateStateVarsOfChildByElmtId(elmtId, {});
            }
        }, { name: "HspAPageOne" });
    }
}
const COLUMN_SPACE: number = 12;
export class HspAPageOne extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.pageInfos = new NavPathStack();
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: HspAPageOne_Params) {
        if (params.pageInfos !== undefined) {
            this.pageInfos = params.pageInfos;
        }
    }
    updateStateVars(params: HspAPageOne_Params) {
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
                    Button.createWithLabel({ "id": 67108875, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 67108868, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.height({ "id": 67108866, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HarAPageOne', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 67108876, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 67108868, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.height({ "id": 67108866, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspA" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HarAPageTwo', null);
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
                Column.pop();
            }, { moduleName: "hspA", pagePath: "hspA/src/main/ets/pages/HspAPageOne" });
            NavDestination.title('hspA-pageOne');
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
        NavigationBuilderRegister("HspAPageOne", wrapBuilder(HspAPageOneBuilder));
    }
})();
