

import org.gradle.api.Plugin
import org.gradle.api.Project

class MyPluginPractice implements Plugin<Project>{
    @Override
    void apply(Project target) {
        println('Fuck world!!!!!')
    }
}