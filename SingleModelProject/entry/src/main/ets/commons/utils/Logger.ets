import { hilog } from '@kit.PerformanceAnalysisKit';

const LOGGER_PREFIX: string = 'interview_success_logger';

class Logger {
  private domain: number;
  private prefix: string;
  private format: string = '%{public}s : %{public}s';

  constructor(prefix: string = '', domain: number = 0x0000) {
    this.prefix = prefix;
    this.domain = domain;
  }

  debug(...args: string[]): void {
    hilog.debug(this.domain, this.prefix, this.format, args);
  }

  info(...args: string[]): void {
    hilog.info(this.domain, this.prefix, this.format, args);
  }

  warn(...args: string[]): void {
    hilog.warn(this.domain, this.prefix, this.format, args);
  }

  error(...args: string[]): void {
    hilog.error(this.domain, this.prefix, this.format, args);
  }
}

export const logger = new Logger(LOGGER_PREFIX, 0x1234);