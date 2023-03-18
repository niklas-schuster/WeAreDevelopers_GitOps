{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "identifier" -}}
{{- printf "%s-%s" .Values.application.name .Values.application.stage | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "selectorLabels" -}}
app.kubernetes.io/name: {{ include "identifier" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "labels" -}}
{{ include "selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- end }}