declare class Logger {
    private domain;
    private prefix;
    private format;
    constructor(prefix: string);
    debug(...args: string[]): void;
    info(...args: string[]): void;
    warn(...args: string[]): void;
    error(...args: string[]): void;
}
declare const _default: Logger;
export default _default;
